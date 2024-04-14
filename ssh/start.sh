#!/bin/bash

systemctl --user enable ssh-agent
systemctl --user start ssh-agent

systemctl --user status ssh-agent

