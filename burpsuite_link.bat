chcp 936
@echo off
setlocal enabledelayedexpansion
mode con cols=94 lines=30&color 0a&title 创建Burp Suite一键启动脚本快捷方式
echo [+] 获得当前路径:%~dp0
set path=%~dp0burpsuite_loader.bat
echo.
if exist %path% (
echo [+] 发现Burp一键启动脚本burpsuite_loader.bat
echo.
echo [+] 启动脚本路径：
echo.
echo [+] %path%
echo.
goto :creat
) else (
echo [-] 注意,未发现启动脚本burpsuite_loader.bat，请注意是否改名,程序退出... 
echo.
pause
exit
)

:creat
echo [+] 开始创建快捷方式...
echo.
rem 设置程序的完整路径(必要)
set Program=%path%
rem 设置快捷方式名字(必要)
set LinkName=BurpSuite
rem 程序工作路径
set WorkDir=%~dp0
rem 设置快捷方式说明
set Desc=BurpSuite一键启动
rem 设置快捷方式图标
set icon=%~dp0/BurpSuite.ico
if not defined WorkDir call:GetWorkDir "%Program%"
(echo Set WshShell=CreateObject("WScript.Shell"^)
echo strDesKtop=WshShell.SpecialFolders("DesKtop"^)
echo Set oShellLink=WshShell.CreateShortcut(strDesKtop^&"\%LinkName%.lnk"^)
echo oShellLink.TargetPath="%Program%"
echo oShellLink.WorkingDirectory="%WorkDir%"
echo oShellLink.WindowStyle=1
echo oShellLink.Description="%Desc%"
echo oShellLink.IconLocation="%icon%"
echo oShellLink.Save)>makelnk.vbs
echo [+] 桌面快捷方式创建成功!!
echo.
makelnk.vbs
del /f /q makelnk.vbs
pause
goto :eof
:GetWorkDir
set WorkDir=%~dp1
set WorkDir=%WorkDir:~,-1%
pause
goto :eof