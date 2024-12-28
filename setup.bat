@echo off
setlocal enabledelayedexpansion

:: Check if the script is run as administrator
openfiles >nul 2>nul
if %errorlevel% neq 0 (
    echo Please run this script as administrator.
    exit /b 1
)

:: Define directories
set USER_HOME=%USERPROFILE%
set TARGET_DIR=%USER_HOME%\Documents\mpvtui667

:: Create directory if it doesn't exist
if not exist "!TARGET_DIR!" (
    mkdir "!TARGET_DIR!"
    if %errorlevel% equ 0 (
        echo Created directory !TARGET_DIR!
    ) else (
        echo Failed to create directory.
        exit /b 1
    )
)

:: Copy mpvtui.py to the target directory
copy mpvtui.py "!TARGET_DIR!" >nul
if %errorlevel% equ 0 (
    echo Copied mpvtui.py to !TARGET_DIR!
) else (
    echo Failed to copy mpvtui.py.
    exit /b 1
)

:: Copy mpvtui.py to the target directory
copy mpvtui.bat "!TARGET_DIR!" >nul
if %errorlevel% equ 0 (
    echo Copied mpvtui.bat to !TARGET_DIR!
) else (
    echo Failed to copy mpvtui.bat.
    exit /b 1
)

:: Create a batch script to run the Python file
echo @echo off > %USERPROFILE%\Documents\mpvtui667.bat
echo python "%USERPROFILE%\Documents\mpvtui667\mpvtui.py" >> %USERPROFILE%\Documents\mpvtui667.bat

:: Set file permissions (using icacls)
icacls "%USERPROFILE%\Documents\mpvtui667.bat" /grant %USERNAME%:F >nul


echo Don't forget to edit Path variable for "%USERPROFILE%\Documents\mpvtui667"

echo Done, my vro

exit /b 0
