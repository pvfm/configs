#!/bin/bash

rsync -a --delete --exclude='.claude' ~/.config/nvim/ ./nvim/
