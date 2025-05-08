# Configuración de seguridad y personalización del sistema para cumplir con el Esquema Nacional de Seguridad (ENS)

Este paquete automatiza la configuración de seguridad básica y la personalización del entorno gráfico en sistemas Linux con entorno gráfico para cumplir con la norma del Esquema Nacional de Seguridad (ENS).

Está diseñado para ser instalado en entornos corporativos donde se desee aplicar una configuración estandarizada de seguridad y presentación.

## Funcionalidades

Al instalar este paquete, se aplicarán las siguientes configuraciones:

- ✅ **Antivirus ClamAV**  
  Se instala y configura correctamente el antivirus [ClamAV](https://www.clamav.net/) para protección básica frente a malware.

- ✅ **Aviso informativo en el login (popup)**  
  Se muestra un mensaje de advertencia o información al usuario cuando inicia sesión, mediante una ventana emergente (popup), avisando del uso correcto del sistema.

- ✅ **Bloqueo de usuarios tras múltiples intentos fallidos**  
  Se configura el sistema para bloquear a un usuario durante **15 minutos** tras **5 intentos fallidos** de login (mediante el módulo de seguridad `faillock`).

- ✅ **Wallpaper corporativo**  
  Se instala una imagen corporativa en `/usr/share/backgrounds/` para que el usuario pueda establecerla como fondo de escritorio.

- ✅ **Configuración del fondo en pantalla de login (LightDM)**  
  Se configura **LightDM** para mostrar automáticamente el fondo corporativo durante el login.

- ✅ **Ocultación de la lista de usuarios en pantalla de login**  
  Se configuran los siguientes gestores de sesión para ocultar la lista de usuarios y reforzar la privacidad:
  - `lightdm`
  - `sddm`
  - `gdm3`

- ✅ **Blacklists configurables para los navegadores Google Chrome y Mozilla Firefox**  
  Se han generado un par de ficheros de ejemplo con urls prohibidas para los navegadores citados.

## Instalación

Para instalar este paquete, puedes usar tu gestor de paquetes habitual (por ejemplo `dpkg -i` o `apt` si se proporciona en un repositorio).

Durante la instalación, aparecerá un **diálogo de configuración de PAM**.  
En ese momento, selecciona las opciones relacionadas con `faillock` para que el sistema aplique correctamente las políticas de bloqueo tras intentos fallidos.

## Requisitos

- Distribuciones Linux basadas en Debian/Ubuntu
- Gestores de sesión soportados: `lightdm`, `sddm`, `gdm3`

## Licencia

Este paquete se distribuye bajo la licencia GPL v2. Consulta el archivo `LICENSE` para más detalles.
