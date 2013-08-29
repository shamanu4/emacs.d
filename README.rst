============
Emacs config
============

Clone this repo. Move to everything to .emacs.d.

Install required packages::

    $ sudo pip install pylint pep8
    $ sudo apt-get install pyflakes pycheker

PyChecker is turned off, you can uncomment it in ./bin/lintrunner.py


Install CEDET::

    $ sudo apt-get install texinfo  # makeinfo
    $ cd plugins/cedet-1.1
    $ make
