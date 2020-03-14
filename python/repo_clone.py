#!/usr/bin/env python
# PYTHON_ARGCOMPLETE_OK

import json
import requests
import argcomplete
import argparse
import urllib3

from os import path
from git import Repo


urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)
VERIFY = False
PROXIES = None

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


def parseargs() -> list :
    parser = argparse.ArgumentParser()
    parser.add_argument("--from", "-F", help="Name of organization or user for which to clone repositories.", required = True)
    parser.add_argument("--type", "-T", help="Type of name (organization|user).", required=True, type=str, choices={'organization', 'user'})
    parser.add_argument("--dir", "-D", help="Destination directory", required=True, type=str)
    argcomplete.autocomplete(parser)
    args = vars(parser.parse_args())
    return args


def directory_make(directory: str, repo_full_name: str) -> str:
    if directory[-1] == '/':
        return directory + repo_full_name

    return directory + "/" + repo_full_name


def main(args: list):

    # build url
    url = 'https://api.github.com'
    url += "/orgs/" if args['type'] == 'organization' else "/users/"
    url += args['from'] + "/repos"

    try:
        # try to connect to github
        r = requests.get(url=url.format(url), proxies=PROXIES, verify=VERIFY)
        if r.status_code == 200:
            repo_list = json.loads(r.text)
        else:
            print(bcolors.WARNING + "[*] " + url + " returned " + r.status_code + " status code" + bcolors.ENDC)

    except requests.exceptions.Timeout:
        print(bcolors.FAIL + "[*] " + url + " connection timeout" + bcolors.ENDC)
    except requests.exceptions.ConnectionError:
        print(bcolors.FAIL + "[*] " + url + " connection error" + bcolors.ENDC)
    except requests.exceptions.RequestException:
        print(bcolors.FAIL + "[*] " + url + " very horrible thing happened" + bcolors.ENDC)

    args_dir = args['dir']

    for repo in repo_list:
        
        full_name = repo['full_name']
        clone_url = repo['clone_url']

        print(bcolors.OKBLUE + "[*] cloning " + full_name + " from " + clone_url + bcolors.ENDC)

        destination_dir = directory_make(args_dir, full_name)

        if path.exists(destination_dir): 
            print(bcolors.WARNING + "[*] skipping cloning " + full_name + " in " + destination_dir + ", directory already exists" + bcolors.ENDC)
            continue

        Repo.clone_from(clone_url, destination_dir)
        print(bcolors.OKGREEN + "[*] cloning " + full_name + " completed" + bcolors.ENDC)

if __name__ == "__main__":
    args = parseargs()
    main(args)
