@echo off
set commit_message=%*
git add .
git commit -m "%date% %time% %commit_message%"
git push