#!/bin/bash
cd "${0%/*}"
git pull
grunt cron
