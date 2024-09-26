@echo off
setlocal EnableExtensions EnableDelayedExpansion
set "EVENT=%1"

if /i "%EVENT%" == "PreClean" (
    rem Implement PreClean
    exit /b 0
)

if /i "%EVENT%" == "PreBuildEvent" (
    rem Implement PreBuildEvent
    exit /b 0
)

if /i "%EVENT%" == "PreLinkEvent" (
    rem Implement PreLinkEvent
    exit /b 0
)

if /i "%EVENT%" == "PostBuildEvent" (
    mkdir %SolutionDir%.install\%Platform%-%Configuration%\include 2>nul
    echo %ProjectDir%zlib.h -^> %SolutionDir%.install\%Platform%-%Configuration%\include
    echo %ProjectDir%zconf.h -^> %SolutionDir%.install\%Platform%-%Configuration%\include
    attrib -R %SolutionDir%.install\%Platform%-%Configuration%\include\*.h >nul
    copy /y %ProjectDir%zlib.h %SolutionDir%.install\%Platform%-%Configuration%\include >nul
    copy /y %ProjectDir%zconf.h %SolutionDir%.install\%Platform%-%Configuration%\include >nul
    attrib +R %SolutionDir%.install\%Platform%-%Configuration%\include\*.h

    exit /b 0
)

if /i "%EVENT%" == "CustomBuildStep" (
    rem Implement CustomBuildStep
    exit /b 0
)

if /i "%EVENT%" == "TestPrep" (
    rem Implement TestPrep
    exit /b 0
)

if /i "%EVENT%" == "Test" (
    rem Implement Test
    exit /b 0
)

echo ************** INVALID BUILD EVENT: %EVENT% ********************
exit /b 3
