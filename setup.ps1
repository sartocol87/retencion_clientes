Clear-Host

Write-Host "Iniciando configuracion del entorno..."

# Crear entorno virtual si no existe
if (-not (Test-Path ".venv")) {

    Write-Host "Creando entorno virtual con Python 3.11..."

    py -3.11 -m venv .venv

    if ($LASTEXITCODE -ne 0) {
        Write-Host "ERROR: No se pudo crear el entorno virtual."
        exit 1
    }
}

# Activar entorno virtual
. .\.venv\Scripts\Activate.ps1

Write-Host ""
Write-Host "Python activo:"
python -c "import sys; print(sys.executable)"

# Actualizar pip
Write-Host ""
Write-Host "Actualizando pip..."

python -m pip install --upgrade pip

if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: No se pudo actualizar pip."
    exit 1
}

# Instalar dependencias
if (Test-Path "requirements.txt") {

    Write-Host ""
    Write-Host "Instalando dependencias..."

    python -m pip install -r requirements.txt

    if ($LASTEXITCODE -ne 0) {
        Write-Host ""
        Write-Host "ERROR: Fallo la instalacion de dependencias."
        exit 1
    }

}
else {

    Write-Host ""
    Write-Host "ADVERTENCIA: No se encontro requirements.txt"
}

Write-Host ""
Write-Host "Version de Python:"
python --version

Write-Host ""
Write-Host "Entorno listo correctamente."