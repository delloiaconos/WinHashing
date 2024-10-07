@ECHO OFF
SETLOCAL

REM "%~dp0"
FOR %%F IN (*) DO CALL :GET_HASHS %%F

:: force execution to quit at the end of the "main" logic
EXIT /B %ERRORLEVEL%


:: GET_MD5 - A function to get HASH SHA256
:GET_MD5
FOR /F "skip=1 tokens=* delims=" %%# in ('CertUtil -hashfile %* MD5') do (
  SET "VAL_MD5=%%#"
  EXIT /B 0
)

:: GET_SIZE - A function to get file size
:GET_SIZE
SET VAL_SIZE=%~z1
EXIT /B 0


:: GET_SHA256 - A function to get HASH SHA256
:GET_SHA256
FOR /F "skip=1 tokens=* delims=" %%# in ('CertUtil -hashfile %* SHA256') do (
  SET "VAL_SHA256=%%#"
  EXIT /B 0
)


:GET_HASHS
CALL :GET_SIZE %*
CALL :GET_MD5 %*
CALL :GET_SHA256 %*
ECHO %* %VAL_SIZE% %VAL_MD5% %VAL_SHA256%
EXIT /B 0







