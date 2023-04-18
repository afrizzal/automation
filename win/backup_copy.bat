@echo off
echo Starting backup job...
"C:\Program Files\Microsoft SQL Server\110\Tools\Binn\SQLCMD.exe" -S localhost -U sa -P password -Q "BACKUP DATABASE [MyDatabase] TO DISK='C:\Backups\MyDatabase.bak' WITH NOFORMAT, NOINIT, NAME='MyDatabase-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, STATS=10"
echo Backup job complete.
