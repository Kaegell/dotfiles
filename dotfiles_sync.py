#!/usr/bin/env python3
### dotfiles_sync
### creates symlinks from a JSON datatable and picked dotfiles
### written using pyton 3.6.2

import os
import json
import subprocess

with open('map.json') as js_file:
    data = json.load(js_file)

for elm in data["map"]:
    str = "{0} -> {1}".format(elm["file"],elm["target"])
    print(str)
    ln_cmd = "ln -rsf ./{0} {1}".format(elm["file"],\
            os.path.expanduser(elm["target"]))
    p = subprocess.Popen(ln_cmd.split(), stdout=subprocess.PIPE)
    out,err = p.communicate()
    if err == None:
        print("symlinking successful\n")
    else:
        print("symlinking failed")
        exit(1)
print("all done :)")
exit(0)

