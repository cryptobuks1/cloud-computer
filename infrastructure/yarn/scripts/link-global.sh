# The cloud computer yarn shim
CLOUD_COMPUTER_YARN=$(dirname $(yarn readlink-f $0))/../bin/cloud-computer-yarn.js

# Yarn installs to /usr/bin, so use /usr/local/bin to appear first in PATH
SYSTEM_YARN=/usr/local/bin/yarn

# Early exit if yarn is already our symlink to avoid creating a recusive symlink
if [ "$(yarn readlink-f $SYSTEM_YARN)" = "$(yarn readlink-f $CLOUD_COMPUTER_YARN)" ]; then
  exit 0
fi

# Ensure yarn shim source code is built
yarn build

# Symlink cloud computer yarn to system yarn location
sudo ln -s "$CLOUD_COMPUTER_YARN" "$SYSTEM_YARN"
