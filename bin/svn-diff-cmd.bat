@ECHO OFF

SET DIFF="C:\Program Files\SourceGear\Common\DiffMerge\sgdm.exe"

SET BASE_NAME="%3"
SET MINE_NAME="%5"
SET BASE="%6"
SET MINE="%7"

%DIFF% /t1="%BASE_NAME%" /t2="%MINE_NAME%" "%BASE%" "%MINE%"
