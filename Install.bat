echo Instalador de la base de datis Universidad
echo Autor: Steffi Becerra Tapia
echo 8 de agosto del 2022
sqlcmd -S. -E -i BDUniversidad.sql
sqlcmd -S. -E -i BDUniversidadPA.sql
echo Se ejecuto correctamente la base de datos
pause