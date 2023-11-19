@echo off
set commit_message=%*
if "%commit_message%"=="" (
  set /p commit_message="请输入提交信息: "
)
git add .
git commit -m "%date% %time% %commit_message%"
git push
echo 提交完成！
pause