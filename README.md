# Raspbian en modo quiosco 

## Imagen
Esta configuracion se hizo en un dispositivo Le Potato (aml-s905x-cc) de la marca Libre Computer, [usando la imagen de Raspbian 12 exclusiva para este dispositivo](https://distro.libre.computer/ci/raspbian/12/). Ojo, hay tres imagenes para este modelo. Debemos usar la que **NO** dice "full" o "lite".

## Configuracion

El navegador que usaremos en el Le Potato es Chromium, asi que asegurate de tenerlo instalado.

```sudo apt install chromium-browser```

Una vez nos aseguramos de que tenemos chromium instalado, clonar el repositorio y acceder al directorio.

```
git clone https://github.com/f-reyes/raspbian-kiosk.git
cd raspbian-kiosk
```

Este repositorio cuenta con tres archivos que necesitaremos para poner nuestra instalacion Raspbian en modo quiosco:

- kiosk.service: Unit file que colocaremos en /etc/systemd/system/
**Es importante que modifiquemos este archivo para colocar el usuario que usaremos para correr este servicio, asi como el URL que mostrara el navegador. Tambien debemos tener en cuenta si el path de el script kiosk.sh que descargaste al clonar este repositorio es el correcto.**
```
sudo cp ./kiosk.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable kiosk.service
sudo systemctl start kiosk.service
```
En este punto, el navegador debe haberse abierto en pantalla completa con el URL que colocamos.

- hide_mouse.sh: Este script va a instalar unas herramientas que van a automatizar el proceso de esconder el mouse cuando este no se mueva por unos segundos. **Este script no debe ser ejecutado usando sudo, lo mejor es que lo ejecutemos usando el mismo usuario que colocamos en el unit file.**

```./hide_mouse.sh```

- kiosk.sh:  Este script se invoca antes de abrir el navegador, su funcion es hacerle creer a chromium que la ultima vez que se estuvo usando el navegador se pudo cerrar de manera exitosa. Esto impide que aparezcan ciertos molestos mensajes.




