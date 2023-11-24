Some points to ponder...

1. The ftplugin directory gets read into nvim after the plugins directory so keymaps
   in this directory will overwrite the ones in plugins.

2. From what Ive read it seems to be better to set specific options and keymaps for
   filetypes this way rather than using autocommands.

3. Fun to play around with this and experiment
