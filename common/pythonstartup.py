import readline
import rlcompleter
import atexit
import os

# tab complete
readline.parse_and_bind("tab: complete")
# history file
if os.environ.get("OS").startwith("Windows"):
    histfile = os.path.join(os.environ["USERPROFILE"], ".python_history")
else:
    histfile = os.path.join(os.environ["HOME"], ".python_history")

try:
    readline.read_history_file(histfile)
except IOError:
    pass
atexit.register(readline.write_history_file, histfile)
del os, histfile, readline, rlcompleter, atexit
