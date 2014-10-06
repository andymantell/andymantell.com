#!/bin/bash
source /etc/profile
cd "${0%/*}"
git pull
grunt cron
