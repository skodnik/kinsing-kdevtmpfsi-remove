#!/usr/bin/env sh

uname -a

read -r -p "Try to find kinsing kdevtmpfsi miners? (y/n): " response
case "$response" in
[yY][eE][sS] | [yY])
  echo "Start."
  date
  ;;
*)
  echo "Ok. Exit."
  exit 0
  ;;
esac

setup_color() {
  # Only use colors if connected to a terminal
  if [ -t 1 ]; then
    RED=$(printf '\033[31m')
    GREEN=$(printf '\033[32m')
    YELLOW=$(printf '\033[33m')
    BLUE=$(printf '\033[34m')
    BOLD=$(printf '\033[1m')
    RESET=$(printf '\033[m')
  else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    BOLD=""
    RESET=""
  fi
}

setup_color

# Search active processes by name
echo "\n${YELLOW}>>>>>>>> Grep result <<<<<<<<${RESET}\n"
ps -ef | egrep 'kdevtmpfsi|kinsing' | grep -v 'grep'

# Run processes
echo "\n${YELLOW}>>>>>>>> Processes started on behalf of the www-data user <<<<<<<<${RESET}\n"
ps --user www-data

read -r -p "Try to disable miners? (y/n): " response
case "$response" in
[yY][eE][sS] | [yY])
  ;;
*)
  echo "Ok. Exit."
  exit 0
  ;;
esac

# Kill processes
echo "\n${YELLOW}>>>>>>>> Kill processes kinsing kdevtmpfsi <<<<<<<<${RESET}\n"
killall kinsing kdevtmpfsi

# List files in tmp dirs
echo "\n${YELLOW}>>>>>>>> List files in tmp dirs <<<<<<<<${RESET}\n"
ls -laF /tmp /var/tmp

read -r -p "Try to remove all files in tmp folders? (y/n): " response
case "$response" in
[yY][eE][sS] | [yY])
  ;;
*)
  echo "Ok. Exit."
  exit 0
  ;;
esac

# Delete
find / -iname kdevtmpfsi -exec rm -fv {} \;
find / -iname kinsing -exec rm -fv {} \;

# Cleanup tmp dirs
rm -rf /tmp/* /tmp/.* /var/tmp/* /var/tmp/.*

cat <<-EOF
    ${GREEN}All done. I hope so...${RESET}
EOF