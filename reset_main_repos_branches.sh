#!/bin/bash

(cd ~/dev/gsfn/satisfaction  && git fetch && git_reset_branches.sh) &
(cd ~/dev/gsfn/services && git fetch && git_reset_branches.sh) &
(cd ~/dev/gsfn/consumer && git fetch && git_reset_branches.sh) &
(cd ~/dev/gsfn/bizcon && git fetch && git_reset_branches.sh) &
(cd ~/dev/gsfn/ironfan-homebase && git fetch && git_reset_branches.sh) &
