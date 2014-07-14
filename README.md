heroku Cookbook
===============
This cookbook setup your heroku CLI.

Environments
------------
Only test Ubuntu 14.04

Requirements
------------
- `ruby` - heroku toolbelt needs ruby.

Attributes
----------
none.

Usage
- Include `heroku` in your node's `run_list`:
```json
{
  "name":"my_node",
  "run_list": [
    "recipe[heroku]"
  ]
}
```

- set private ssh key pair file on files/default/.ssh/id_rsa_heroku .

if your github ssh-private-key-file is ~/.ssh/id_rsa:
```sh
mkdir -p files/default/.ssh
cp ~/.ssh/id_rsa files/default/.ssh/id_rsa_heroku
```

----

License and Authors
-------------------
MIT License.
