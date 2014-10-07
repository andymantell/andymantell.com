#!/bin/bash
cd "${0%/*}"
git pull
npm install
grunt cron
