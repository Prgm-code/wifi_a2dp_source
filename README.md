# Proyecto ESP32 Wi-Fi A2DP Source

Este proyecto es una combinación de un ejemplo de estación Wi-Fi y un ejemplo de A2DP Source para el ESP32.

## Configuración y Compilación

Sigue estos pasos para configurar y compilar el proyecto.

### 1. Limpiar el Proyecto

Ejecuta el siguiente comando para eliminar la configuración y los archivos de compilación antiguos:

```bash
idf.py fullclean
```

### 2. Configurar el Proyecto

Ejecuta el siguiente comando para abrir el menú de configuración:

```bash
idf.py menuconfig
```

En el menú, puedes configurar las credenciales de Wi-Fi y el nombre del dispositivo Bluetooth.

-   `(Top)` -> `Example Configuration`
    -   `WiFi SSID`: El SSID de tu red Wi-Fi.
    -   `WiFi Password`: La contraseña de tu red Wi-Fi.
-   `(Top)` -> `A2DP Example Configuration`
    -   `Target Device Name`: El nombre del dispositivo Bluetooth al que te quieres conectar (por ejemplo, un altavoz).

Guarda la configuración y sal del menú.

### 3. Compilar el Proyecto

Finalmente, compila el proyecto con el siguiente comando:

```bash
idf.py build
```

### 4. Flashear el Dispositivo

Una vez que la compilación sea exitosa, puedes flashear el firmware a tu dispositivo ESP32:

```bash
idf.py -p /dev/ttyUSB0 flash
```

**Nota:** Reemplaza `/dev/ttyUSB0` con el puerto serie de tu dispositivo.

### 5. Monitorear la Salida

Para ver los logs del dispositivo, usa el monitor serie:

```bash
idf.py -p /dev/ttyUSB0 monitor
```
