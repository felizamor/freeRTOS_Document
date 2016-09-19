@echo off
echo "copy files to blog"
rd /s /q F:\myBlog\source\freeRTOS
md "F:\myBlog\source\freeRTOS"
xcopy F:\freertos_doc\_book\*.* ..\myBlog\source\freeRTOS /s /e /h /d /y /c
pause
