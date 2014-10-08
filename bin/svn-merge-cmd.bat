@ECHO OFF

SET DIFF="C:\Program Files\SourceGear\Common\DiffMerge\sgdm.exe"

SET BASE="%1"
SET THEIRS="%2"
SET MINE="%3"
SET MERGED="%4"
SET WCPATH="%5"

%DIFF% /merge /result="%MERGED%" /t1=THEIRS /t2="%WCPATH%" /t3=MINE "%THEIRS%" "%BASE%" "%MINE%"
