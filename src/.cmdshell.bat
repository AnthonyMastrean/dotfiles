@ECHO OFF

SET PROMPT=$_$E[0;32m%USERNAME%@%COMPUTERNAME%$E[m$S$E[0;33m$P$E[m$_cmd$G$S
SETX PROMPT %PROMPT%