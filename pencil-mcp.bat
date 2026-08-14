@echo off
setlocal enabledelayedexpansion

:: Caminho base das extensões do VS Code
set "EXT_PATH=%USERPROFILE%\.vscode\extensions"

:: Encontrar a pasta mais recente do Pencil
set "PENCIL_PATH="
for /d %%i in ("%EXT_PATH%\highagency.pencildev-*") do (
    set "PENCIL_PATH=%%i"
)

:: Verificar se encontrou
if "%PENCIL_PATH%"=="" (
    echo Erro: Extensao Pencil nao encontrada no VS Code.
    exit /b 1
)

:: Executar o servidor MCP com os argumentos passados
"%PENCIL_PATH%\out\mcp-server-windows-x64.exe" %*