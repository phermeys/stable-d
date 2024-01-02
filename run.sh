#!/bin/bash

# Begin script, show source directory contents
echo "Running run.sh"
ls -lah /stable-d

# Check for init file
if [ -e "/stable-d/cosmos" ]; then
    echo "File exists, moving on."
else
# This should only run when the container is instatiated
    echo "No cosmos, copying source"
    touch /stable-d/cosmos
    cp -r /app/easy-diffusion/* /stable-d/
    cp config.yaml /stable-d
fi

# Scratch code
# tail -f /dev/null
# cd /stable-d
# touch test

# Start stable diffusion
/stable-d/start.sh

# This will keep the container running if stable-d crashes or otherwise fails
while true; do
  sleep 10
  echo "Just chillen"
  uptime -p
  TZ='America/Los_Angeles' date
done
