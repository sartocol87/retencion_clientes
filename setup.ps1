Clear-Host

Write-Host "Iniciando configuracion del entorno..."

# Crear entorno virtual si no existe
if (-not (Test-Path ".venv")) {

    Write-Host "Creando entorno virtual con Python 3.11..."

    py -3.11 -m venv .venv
}

# Activar entorno
. .\.venv\Scripts\Activate.ps1

# Mostrar Python activo
Write-Host ""
Write-Host "Python activo:"
python -c "import sys; print(sys.executable)"

# Actualizar pip
Write-Host ""
Write-Host "Actualizando pip..."

python -m pip install --upgrade pip

# Instalar dependencias
if (Test-Path "requirements.txt") {

    Write-Host ""
    Write-Host "Instalando dependencias..."

    python -m pip install -r requirements.txt
}

Write-Host ""
Write-Host "Version de Python:"
python --version

Write-Host ""
Write-Host "Entorno listo."