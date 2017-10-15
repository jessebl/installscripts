Role Name
=========

Installs and configures zsh with oh-my-zsh

Requirements
------------

Root access

Role Variables
--------------

ohmyzsh_theme: agnoster

zsh_config_file: "{{ lookup('env','HOME') }}/.zshrc"

ohmyzsh_dir: "{{ lookup('env','HOME') }}/.oh-my-zsh"

Dependencies
------------

None

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: zsh }

License
-------

GPLv3

Author Information
------------------
