echo off
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo �Ǘ��Ҍ����Ŏ��s���Ă��������B
    pause
    exit /b 1
)
echo on

REM�@�u���E�U�폜
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Clients\StartMenuInternet\Custom Browser" /f

REM�@�K��o�^����
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\RegisteredApplications" /v "Custom Browser" /f

REM�@�֘A�t���폜�@
REG DELETE "HKEY_CLASSES_ROOT\CustomHTML" /f

echo off
pause