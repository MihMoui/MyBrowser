echo off
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo �Ǘ��Ҍ����Ŏ��s���Ă��������B
    pause
    exit /b 1
)
echo on

REM�@�u���E�U�Ƃ��ēo�^����
REG ADD "HKLM\SOFTWARE\Clients\StartMenuInternet\Custom Browser" /ve /d "Custom Browser" /f
REG ADD "HKLM\SOFTWARE\Clients\StartMenuInternet\Custom Browser\Capabilities" /v "ApplicationDescription" /d "ApplicationDescription" /f
REG ADD "HKLM\SOFTWARE\Clients\StartMenuInternet\Custom Browser\Capabilities" /v "ApplicationIcon" /d "%cd%\Browser.exe,0" /f
REG ADD "HKLM\SOFTWARE\Clients\StartMenuInternet\Custom Browser\Capabilities" /v "ApplicationName" /d "Custom Browser" /f
REG ADD "HKLM\SOFTWARE\Clients\StartMenuInternet\Custom Browser\Capabilities\Startmenu" /v "StartMenuInternet" /d "Custom Browser" /f
REG ADD "HKLM\SOFTWARE\Clients\StartMenuInternet\Custom Browser\Capabilities\URLAssociations" /v "http" /d "CustomHTML" /f
REG ADD "HKLM\SOFTWARE\Clients\StartMenuInternet\Custom Browser\Capabilities\URLAssociations" /v "https" /d "CustomHTML" /f
REG ADD "HKLM\SOFTWARE\Clients\StartMenuInternet\Custom Browser\DefaultIcon" /ve /d "%cd%\Browser.exe,0" /f
REM REG ADD "HKLM\SOFTWARE\Clients\StartMenuInternet\Custom Browser\InstallInfo" /v "ReinstallCommand" /d "\"%cd%\Browser.exe\" --make-default-browser" /f
REM REG ADD "HKLM\SOFTWARE\Clients\StartMenuInternet\Custom Browser\InstallInfo" /v "HideIconsCommand" /d "\"%cd%\Browser.exe\" --hide-icons" /f
REM REG ADD "HKLM\SOFTWARE\Clients\StartMenuInternet\Custom Browser\InstallInfo" /v "ShowIconsCommand" /d "\"%cd%\Browser.exe\" --show-icons" /f
REG ADD "HKLM\SOFTWARE\Clients\StartMenuInternet\Custom Browser\InstallInfo" /v "IconsVisible" /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Clients\StartMenuInternet\Custom Browser\shell" /ve /f
REG ADD "HKLM\SOFTWARE\Clients\StartMenuInternet\Custom Browser\shell\open" /ve /f
REG ADD "HKLM\SOFTWARE\Clients\StartMenuInternet\Custom Browser\shell\open\command" /ve /d "\"%cd%\Browser.exe\"" /f

REM�@�K��u���E�U�Ƃ��Đݒ�\��
REG ADD "HKLM\SOFTWARE\RegisteredApplications" /v "Custom Browser" /d "Software\Clients\StartMenuInternet\Custom Browser\Capabilities" /f

REM�@�v���g�R���֘A�t���p
REG ADD "HKCR\CustomHTML" /ve /d "Custom HTML Document" /f
REG ADD "HKCR\CustomHTML" /v "AppUserModelId" /d "Custom" /f
REG ADD "HKCR\CustomHTML\Application" /v "AppUserModelId" /d "Custom" /f
REG ADD "HKCR\CustomHTML\Application" /v "ApplicationIcon" /d "%cd%\Browser.exe,0" /f
REG ADD "HKCR\CustomHTML\Application" /v "ApplicationName" /d "Custom Browser" /f
REG ADD "HKCR\CustomHTML\Application" /v "ApplicationDescription" /d "ApplicationDescription" /f
REG ADD "HKCR\CustomHTML\Application" /v "ApplicationCompany" /d "Google LLC" /f
REG ADD "HKCR\CustomHTML\DefaultIcon" /ve /d "%cd%\Browser.exe,0" /f
REG ADD "HKCR\CustomHTML\shell" /ve /d "" /f
REG ADD "HKCR\CustomHTML\shell\open" /ve /d "" /f
REG ADD "HKCR\CustomHTML\shell\open\command" /ve /d ""%cd%\Browser.exe" --single-argument %1" /f

echo off
PAUSE
