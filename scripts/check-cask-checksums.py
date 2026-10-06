#!/usr/bin/env python3
"""Check every cask's sha256 against the checksums file of its xion release.

Usage: scripts/check-cask-checksums.py [Casks/xiond@X.rb ...]

With no arguments every file in Casks/ is checked. Each cask must have a
url and sha256 for all four platforms (macOS and Linux, arm64 and amd64), and
each sha256 must equal the one the release publishes for that asset in
xiond-VERSION-checksums.txt (checksum.txt for the v12-v14 releases that
shipped bare binaries). Exits non-zero on any mismatch or gap.
"""
import glob
import os
import re
import sys
import urllib.error
import urllib.request

PLATFORMS = {("macos", "arm"), ("macos", "intel"), ("linux", "arm"), ("linux", "intel")}
CHECKSUM_FILES = ("xiond-{version}-checksums.txt", "checksum.txt")
_cache = {}


def fetch(url):
    try:
        with urllib.request.urlopen(url, timeout=60) as response:
            return response.read().decode()
    except urllib.error.HTTPError as error:
        if error.code == 404:
            return None
        raise


def release_checksums(base, version):
    key = (base, version)
    if key not in _cache:
        sums = None
        for name in CHECKSUM_FILES:
            text = fetch(f"{base}/{name.format(version=version)}")
            if text is not None:
                sums = {}
                for line in text.splitlines():
                    if line.strip():
                        digest, filename = line.split()
                        sums[filename] = digest
                break
        _cache[key] = sums
    return _cache[key]


def platform_entries(text):
    """Yield (os, arch, url, sha256) for each on_<os> / on_<arch> block."""
    current_os = None
    arch = None
    url = sha = None
    for line in text.splitlines():
        stripped = line.strip()
        match = re.fullmatch(r"on_(macos|linux) do", stripped)
        if match:
            current_os = match.group(1)
            continue
        match = re.fullmatch(r"on_(arm|intel) do", stripped)
        if match:
            arch, url, sha = match.group(1), None, None
            continue
        if arch:
            match = re.fullmatch(r'url "([^"]+)".*', stripped)
            if match:
                url = match.group(1)
            match = re.fullmatch(r'sha256 "([0-9a-f]{64})"', stripped)
            if match:
                sha = match.group(1)
            if stripped == "end":
                yield current_os, arch, url, sha
                arch = None


def check(path):
    text = open(path).read()
    token = re.search(r'^cask "([^"]+)" do', text, re.M).group(1)
    version = re.search(r'^\s*version "([^"]+)"', text, re.M).group(1)
    failures = []
    seen = set()
    for os_name, arch, url, sha in platform_entries(text):
        platform = f"{os_name}/{arch}"
        seen.add((os_name, arch))
        if not url or not sha:
            failures.append(f"FAIL {token} {platform}: missing url or sha256")
            continue
        url = url.replace("#{version}", version)
        base, asset = url.rsplit("/", 1)
        sums = release_checksums(base, version)
        if sums is None:
            failures.append(f"FAIL {token} {platform}: no checksums file under {base}")
        elif asset not in sums:
            failures.append(f"FAIL {token} {platform}: {asset} not in the release checksums")
        elif sums[asset] != sha:
            failures.append(f"FAIL {token} {platform}: {asset} cask {sha} != release {sums[asset]}")
        else:
            print(f"ok   {token} {version} {platform} {asset} {sha}")
    for os_name, arch in sorted(PLATFORMS - seen):
        failures.append(f"FAIL {token} {os_name}/{arch}: no url for this platform")
    return failures


def main():
    paths = sys.argv[1:] or sorted(glob.glob(os.path.join("Casks", "*.rb")))
    failures = []
    for path in paths:
        failures += check(path)
    for failure in failures:
        print(failure)
    print(f"{len(paths)} casks checked, {len(failures)} failures")
    return 1 if failures else 0


if __name__ == "__main__":
    sys.exit(main())
