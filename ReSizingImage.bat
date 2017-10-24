@echo off 
SETLOCAL ENABLEDELAYEDEXPANSION

set quality=85
set timeOut=0
rem folder is the program argument variable, the folder name 
set folder=%1
echo  !folder!
for /R %folder% %%F in (*.jpg) do (
    rem output file is input file name with extension .GIF

   set outputFile="%%F"
 
   

    set fileExtension="%%~xF"
    
   if   !fileExtension!==".jpg" (
		if not exist "%%~F_org" (
		   copy "%%~F" "%%~F_org"
		   convert "%%F" -sampling-factor 4:2:0 -strip -quality %quality% -interlace JPEG -colorspace RGB !outputFile!
		   echo  "%%~nF.jpg"  
		   echo !outputFile! DONE
		   ECHO   !fileExtension!
		   TIMEOUT %timeOut%
	 
       )   
   )
)
echo PROGRAM IS OVER
TIMEOUT 1    
