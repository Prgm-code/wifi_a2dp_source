# Proyecto ESP32 Wi-Fi y Bluetooth A2DP

Este proyecto para el microcontrolador ESP32 combina conectividad Wi-Fi con el perfil de Bluetooth A2DP (Advanced Audio Distribution Profile). Permite que el ESP32 se conecte a una red Wi-Fi y, al mismo tiempo, transmita audio a un altavoz o auriculares Bluetooth.

Este código es una fusión de los ejemplos `station` y `a2dp_source` del ESP-IDF.

## Características

*   Conexión a una red Wi-Fi (WPA2/WPA3).
*   Escaneo y conexión a un dispositivo de audio Bluetooth A2DP (altavoz, auriculares, etc.).
*   Transmisión de un tono de audio de prueba al dispositivo Bluetooth conectado.

## Requisitos Previos

*   Tener instalado el framework [ESP-IDF](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/index.html) de Espressif.
*   Una placa de desarrollo ESP32.
*   Un altavoz o auriculares Bluetooth.

## Cómo Empezar

### 1. Clonar el Repositorio

```bash
git clone https://github.com/tu-usuario/tu-repositorio.git
cd tu-repositorio
```

### 2. Configurar el Proyecto

Abre el menú de configuración del proyecto:

```bash
idf.py menuconfig
```

En el menú, debes configurar las siguientes opciones:

*   **Configuración Wi-Fi:**
    *   Ve a `Example Configuration` > `WiFi SSID` e introduce el nombre de tu red Wi-Fi.
    *   Ve a `Example Configuration` > `WiFi Password` e introduce la contraseña.

*   **Configuración Bluetooth:**
    *   Ve a `A2DP Example Configuration` > `Target Device Name` e introduce el nombre de tu dispositivo Bluetooth.

*   **Tabla de Particiones (Importante):**
    *   Este proyecto es grande y requiere una tabla de particiones que asigne más espacio a la aplicación.
    *   En el menú, ve a `Partition Table` y selecciona la opción `( ) Custom partition table CSV`.
    *   Asegúrate de que el campo `Custom partition CSV file` tenga el valor `partitions.csv`. El proyecto ya incluye este archivo.

Guarda la configuración y sal del menú.

### 3. Compilar y Flashear

Compila el proyecto y súbelo a tu placa ESP32. **Recuerda reemplazar `/dev/ttyUSB0` con el puerto serie de tu placa.**

```bash
idf.py build
idf.py -p /dev/ttyUSB0 flash
```

### 4. Monitorear la Salida

Puedes ver los mensajes de estado de la conexión Wi-Fi y Bluetooth a través del monitor serie:

```bash
idf.py -p /dev/ttyUSB0 monitor
```

## Contribuciones

¡Las contribuciones son bienvenidas! Si tienes alguna idea o mejora, no dudes en abrir un *Pull Request*.

## Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo `LICENSE` para más detalles.