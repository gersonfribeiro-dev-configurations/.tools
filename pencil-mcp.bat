@echo off
setlocal enabledelayedexpansion

:: Caminho base das extensões do VS Code
set "EXT_PATH=%USERPROFILE%\.vscode\extensions"

:: Encontrar a pasta mais recente do Pencil baseada na DATA de modificação
set "PENCIL_PATH="

:: O comando 'dir /b /ad /o-d' lista as pastas ordenadas da mais nova para a mais velha
for /f "delims=" %%i in ('dir /b /ad /o-d "%EXT_PATH%\highagency.pencildev-*" 2^>nul') do (
    set "PENCIL_PATH=%EXT_PATH%\%%i"
    :: Como a primeira pasta encontrada é a mais nova, paramos o loop imediatamente
    goto :found 
)

:found
:: Verificar se encontrou
if "%PENCIL_PATH%"=="" (
    echo Erro: Extensao Pencil nao encontrada no VS Code.
    exit /b 1
)

:: Executar o servidor MCP com os argumentos passados
"%PENCIL_PATH%\out\mcp-server-windows-x64.exe" %*