
@echo off
setlocal enabledelayedexpansion

color a

echo ================================
echo   Subiendo archivos a GitHub
echo ================================
echo.

REM Verifica si es un repositorio Git

git rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 (
    echo Inicializando repositorio Git...
    git init
) else (
    echo Repositorio Git ya inicializado.
)

REM Agrega archivos
git add .

REM Solicita mensaje de commit
set /p commit="Ingresa el mensaje de commit: "
if "%commit%"=="" (
    set commit=Actualizacion
)

git commit -m "%commit%"
if errorlevel 1 (
    echo Error al hacer commit. ¿Hay cambios para guardar?
    goto end
)
echo Commit hecho: "%commit%"

REM Cambia a rama main
git branch -M main

REM Solicita URL del repositorio remoto
set /p repo_url="Ingresa la URL del repositorio remoto (deja en blanco si ya está configurado): "
if not "%repo_url%"=="" (
    git remote remove origin >nul 2>&1
    git remote add origin %repo_url%
    echo Remoto origin configurado: %repo_url%
) else (
    echo Usando remoto origin existente.
)

REM Empuja cambios
git push -u origin main
if errorlevel 1 (
    echo Error al subir a GitHub. Verifica la URL y tu conexion.
    goto end
)

echo Listo! Cambios subidos a GitHub.
:end
pause