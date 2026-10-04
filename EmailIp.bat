: get public IP from wtfismyip.com/text and email it


set mypath=%~dp0

: scheduled tasks run from C:\Windows\system32, so go to proper drive if needed
E:

: and to the current dir
cd %mypath%

: get ip
wget.exe http://wtfismyip.com/text

: set to var
set /p IP=<text
: get hostname
FOR /F "usebackq" %%i IN (`hostname`) DO SET HOST=%%i
: email
blat.exe -to EMAIL@EXAMPLE.COM -server in-v3.mailjet.com -port 587 -u "MAILJET_USER_HERE" -pw "MAILJET_PASSWORD_HERE" -f andy@siliconrockstar.com -subject "system message" -body "The public IP of %HOST% is %IP%"
: remove ip file
del text
