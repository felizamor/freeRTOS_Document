@echo off
echo "开始复制文件到博客文件夹"
rd /s /q C:\tangguocheng\myBlog\source\freeRTOS
md "C:\tangguocheng\myBlog\source\freeRTOS"
xcopy C:\tangguocheng\freertos_doc\freeRTOS_Document\_book\*.* C:\tangguocheng\myBlog\source\freeRTOS /s /e /h /d /y /c
pause