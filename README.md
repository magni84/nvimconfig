Need to add 
```
allow_remote_control yes
listen_on unix:/tmp/mykitty
```
to ``kitty.conf`` to use ``vim-slime`` REPL.

*Image setup*
Need
``sudo dnf install ImageMagick-devel``

*Molten installation*
Setup up an environment with ``pynvim``, and change to correct path in ``settings.lua``.
Need to run ``:UpdateRemotePlugin'' after ``Molten'' is installed.
