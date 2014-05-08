#! /usr/bin/python
"""
Take every line from stdin (excluding README, python, and shell files)
and create a symbolic link to it from $HOME. Appends a '.' to the
beginning to make them hidden files.
"""
import sys
import os
import subprocess

if __name__ == "__main__":
    files = []
    homedir = os.getenv("HOME")
    current_dir = os.getcwd()
    for filename in sys.stdin.readlines():
        is_dotfile = ("README" not in filename
                      and ".py" not in filename
                      and ".sh" not in filename)
        if is_dotfile:
            files.append(filename.strip())

    newfiles = [homedir + '/.' + f for f in files]
    for i in range(len(files)):
        files[i] = current_dir + "/" + files[i]

    links = zip(files, newfiles)

    for l in links:
        subprocess.call(["ln", "-s", l[0], l[1]])
