<#
Autor: Gabriel Alexis Sierra Rodriguez
Website: www.honeypot.es
Año: 2018
Version: 0.00001
#>
<#
ejecutar antes de nada (esto permite bajar las restricciones de sistema)
set-executionpolicy -ExecutionPolicy unrestricted 
actualiza la ayuda
update-help
#>

#conseguir directorio del script
#$carpeta = $(get-location).Path;

$carpeta = (Get-Item -Path ".\" -Verbose).FullName 
write-host "=========================================================================="
write-host "V85 SCRIPT Version: 0.00001"
write-host "Creado por Vertigo85"
write-host "Web: www.honeypot.es"
write-host "=========================================================================="
write-host "Bienvenido $env:UserName ¿que desea hacer?"
Write-Host "1) Informacion del sistema"
Write-Host "2) Instalar chocolatey" 
write-host "3) Instalar Aikoncwd script"
write-host "4) Importar configuracion wifi" 
write-host "5) Exportar Configuracion wifi"
Write-Host "6) Eliminar metroapps"
write-host "7) Instalar aplicaciones"
write-host "8) Limpiar equipo"
write-host "9) Reiniciar equipo"
write-host "0) Salir"
do {
    $menu = Read-Host "Introdruzca un numero para hacer una accion"
    Switch ($menu) {
        '1'{msinfo32}
        '2'{Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')); break}
        '3'{Invoke-WebRequest https://github.com/aikoncwd/win10script/raw/master/releases/aikoncwd-win10-script-v5.3.zip -OutFile .\master.zip
            Expand-Archive -Path master.zip -DestinationPath %CD%
            aikoncwd-win10-script.vbs; break}
        '4'{netsh wlan add profile filename="$carpeta Wi-Fi.xml" user=all; break}
        '5'{netsh wlan export profile name="Wi-Fi.xml" folder="$carpeta"; break}
        '6'{Get-AppxPackage -AllUsers | Remove-AppxPackage; break}
        '7'{choco install arduino steam goggalaxy battle.net origin notepad++ brackets spotify blender libreoffice 7zip multicommander mpc-be obs virtualbox putty firefox opera chrome foxitreader -y}
        '8'{$temporal = @("C:\Windows\Temp\*", "C:\Windows\Prefetch\*", "C:\Documents and Settings\*\Local Settings\temp\*", "C:\Users\*\Appdata\Local\Temp\*")
            Remove-Item $temporal -force -recurse
            dism /online /cleanup-image /StartComponentCleanup; break
            }
        '9'{restart-computer}
        '0'{return}
        }
        write-host "la accion ha sido realizada"
        pause > null
    }until ($input -eq '0')

<# ejecutar al acabar
set-executionpolicy -ExecutionPolicy restricted
#>