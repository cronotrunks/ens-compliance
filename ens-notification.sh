#!/bin/bash
LAST_LOGIN=$(last -x | grep $USER | awk 'NR==2 {print $4, $5, $6, $7}')

zenity --info --width=600 --height=400 --text="<b>AVISO A LOS USUARIOS DEL SISTEMA</b>\n\nEl uso del sistema solo está permitido a los usuarios autorizados. El acceso no autorizado está terminantemente prohibido y podrá ser objeto de acciones disciplinarias, sin perjuicio de las restantes acciones de naturaleza legal a las que hubiere lugar. Toda la actividad de este sistema se registra y es revisado periódicamente por el personal designado por la dirección. Cualquier usuario que acceda al sistema lo hace declarando conocer y aceptar íntegramente estas reglas y la Normativa General de Utilización de los Recursos y Sistemas de Información del sistema.\n\n<b>Inicio de sesión correcto</b>\n\nLa última vez que iniciaste sesión de forma interactiva en esta cuenta fue: $LAST_LOGIN"
