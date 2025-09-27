@echo off
REM ===============================
REM Auto GitHub Update Script with Pull, Logging, and Auto-Add for New Files
REM ===============================

REM Navigate to your project folder
cd /d "C:\Users\ASusNobody\Documents\NUYS\NUYS-Program-Notes\2025-3-Fall\nuye-2025-fall-html"

REM Log file path
set LOGFILE=git_push_log.txt
echo ============================== >> %LOGFILE%
echo %DATE% %TIME% - Starting Git Push >> %LOGFILE%

REM Check if this is a git repository
git status > nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Not a git repository. Please initialize first. >> %LOGFILE%
    echo Not a git repository. Please initialize first.
    pause
    exit /b
)

REM Pull remote changes first (handles unrelated histories)
git pull origin main --allow-unrelated-histories
IF %ERRORLEVEL% NEQ 0 (
    echo ERROR: git pull failed. Resolve conflicts manually. >> %LOGFILE%
    echo git pull failed. Please resolve conflicts manually.
    pause
    exit /b
)

REM Automatically add all new and modified files including subfolders
REM (This will also pick up any new images added)
for /R %%f in (*) do git add "%%f"

IF %ERRORLEVEL% NEQ 0 (
    echo ERROR: git add failed >> %LOGFILE%
    echo git add failed. See log at %LOGFILE%
    pause
    exit /b
)

REM Check if there is anything to commit
git diff --cached --quiet
IF %ERRORLEVEL% EQU 0 (
    echo No changes to commit. >> %LOGFILE%
    echo No changes to commit.
) ELSE (
    REM Commit changes
    git commit -m "Auto-update from local machine"
    IF %ERRORLEVEL% NEQ 0 (
        echo WARNING: git commit failed >> %LOGFILE%
        echo git commit failed. >> %LOGFILE%
    ) ELSE (
        echo Commit successful >> %LOGFILE%
    )
)

REM Push changes to GitHub
git push origin main
IF %ERRORLEVEL% NEQ 0 (
    echo ERROR: git push failed. Check credentials or repository status. >> %LOGFILE%
    echo git push failed. Check your credentials or repository status.
    pause
    exit /b
)

echo SUCCESS: Git push completed >> %LOGFILE%
echo Git push successful!
pause
