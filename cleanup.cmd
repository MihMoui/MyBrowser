echo off
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo 管理者権限で実行してください。
    pause
    exit /b 1
)
echo on

REM　ブラウザ削除
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Clients\StartMenuInternet\Custom Browser" /f

REM　規定登録解除
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\RegisteredApplications" /v "Custom Browser" /f

REM　関連付け削除　
REG DELETE "HKEY_CLASSES_ROOT\CustomHTML" /f

echo off
pause