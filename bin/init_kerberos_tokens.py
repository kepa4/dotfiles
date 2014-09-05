#! /usr/bin/python
"""Script to initiate kerberos token for the specified identity.

Call by piping input from klist -l into stdin and with the name of
the user you want to initiate a token for as the first argument.
"""
import sys
import subprocess


def token_is_expired(name, caches):
    for cache in caches:
        if "Expired" in cache:
            return True
    return False


if __name__ == "__main__":
    caches = sys.stdin.readlines()[1:]
    name = sys.argv[1]
    name_caches = [cache for cache in caches if name in cache]
    no_kerberos_token = not name_caches or token_is_expired(name, name_caches)
    if no_kerberos_token:
        subprocess.call(["kinit", name])
