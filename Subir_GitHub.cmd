@echo off

setlocal

color a

echo ================================
echo   Subiendo archivos a GitHub
echo ================================
echo.

git init
   
git add .
    
    set /p commit="Ingresa commit "
        

git commit -m "%commit%"

    echo commit hecho %repo_url%
    

    git branch -M main


    set /p repo_url="Ingresa la URL del repositorio remoto (enter para omitir): "
    git remote add origin %repo_url%

    git push -u origin main

    echo listo papa!!
pause
