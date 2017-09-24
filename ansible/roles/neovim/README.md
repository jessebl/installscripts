Role Name
=========

Installs and configures neovim with my init.vim in the top-level `configs` directory

Requirements
------------

Ubuntu or CentOS with root privileges

Role Variables
--------------

stow_location: installscripts/configs

Dependencies
------------

None

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: localhost
      roles:
         - { role: neovim, stow_location: ~/installscripts/configs }

License
-------

GPLv3

Author Information
------------------
