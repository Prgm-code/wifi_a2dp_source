# ESP32 Radio Streaming via Bluetooth A2DP

Este proyecto para el microcontrolador ESP32 combina conectividad Wi-Fi con el perfil de Bluetooth A2DP (Advanced Audio Distribution Profile) para crear un **streamer de radio online**. El ESP32 se conecta a emisoras de radio por internet vía Wi-Fi y retransmite el audio a través de Bluetooth A2DP a altavoces o auriculares.

## Características Principales

- **Conexión Wi-Fi**: Se conecta automáticamente a tu red Wi-Fi (WPA2/WPA3).
- **Streaming de Radio Online**: Reproduce emisoras de radio de internet en tiempo real.
- **Transmisión Bluetooth A2DP**: Envía el audio a altavoces o auriculares Bluetooth.
- **Control por Botón**: Presiona el botón (GPIO 0) para cambiar entre estaciones.
- **18 Emisoras Preconfiguradas**: Incluye una selección curada de emisoras de diferentes géneros:
    - **Electrónica Clásica y Synth-Pop**: Radio PARALAX, Nightride FM, Chrome Radio, etc.
    - **Trance, House y Techno**: 90s90s Trance, PulsRadio TRANCE, TechnoBase.FM, etc.
    - **Emisoras en Español**: Los 40 Classic, Rock FM, Radio Carolina, etc.
    - **Ambient y Chillout**: SomaFM Drone Zone, Radio Dimensione Relax, etc.

## Requisitos Previos

- Tener instalado el framework [ESP-IDF](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/index.html) de Espressif.
- Una placa de desarrollo ESP32.
- Un altavoz o auriculares Bluetooth.

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

Puedes ver los mensajes de estado de la conexión Wi-Fi, Bluetooth y streaming de radio a través del monitor serie:

```bash
idf.py -p /dev/ttyUSB0 monitor
```

## Cómo Usar

1. **Conexión Automática**: Al encender, el ESP32 se conectará automáticamente a Wi-Fi y buscará dispositivos Bluetooth A2DP.

2. **Emparejamiento Bluetooth**: Asegúrate de que tu altavoz/auriculares Bluetooth esté en modo de emparejamiento y tenga el nombre configurado en `menuconfig`.

3. **Reproducción Automática**: Una vez conectado, comenzará a reproducir automáticamente la primera emisora de radio (Radio PARALAX).

4. **Cambio de Estaciones**: Presiona el botón conectado al GPIO 0 (generalmente el botón "BOOT" en las placas de desarrollo) para cambiar a la siguiente estación.

5. **Indicadores LED**: Observa los logs en el monitor serie para ver el estado de las conexiones y qué estación está reproduciéndose.

## Lista de Emisoras Incluidas

### Electrónica Clásica y Synth-Pop
- **Radio PARALAX** - Synth-Pop de los 80 y New Wave
- **Nightride FM** - Synthwave, Retrowave y Cyberpunk  
- **Chrome Radio** - Música de los 80, Italo-Disco y Hi-NRG
- **Radio 80s.cl** - Éxitos clásicos de los 80
- **Radio ZENTRAL** - EBM, Industrial y Gótico

### Trance, House y Techno Clásico
- **90s90s Trance** - Himnos del Trance de los 90
- **PulsRadio TRANCE** - Trance clásico y moderno
- **Classic House Radio** - House clásico y Garage
- **TechnoBase.FM** - Techno clásico y Hands-Up
- **Pioneer DJ Radio** - House, Techno y Dance

### Emisoras en Español (Música)
- **Los 40 Classic** - Pop & Rock 80s, 90s y 2000
- **Rock FM** - Rock clásico español
- **Radio Carolina** - Música urbana y reggaetón
- **Radio Disney** - Pop latino e internacional
- **Radio Futuro** - Rock chileno

### Ambient y Chillout
- **SomaFM Drone Zone** - Texturas ambientales
- **Radio Dimensione Relax** - Chillout, Lounge y Soft Pop
- **Hirschmilch Chillout** - Ambient y Chillout

## Personalización

Para agregar tus propias emisoras de radio, edita el array `radio_stations[]` en el archivo `main/main.c`. Cada entrada debe incluir:
- Nombre de la emisora
- URL del stream (HTTP/HTTPS)
- Descripción

## Solución de Problemas

- **No se conecta a Wi-Fi**: Verifica las credenciales en `menuconfig`
- **No encuentra dispositivo Bluetooth**: Asegúrate de que el nombre del dispositivo en `menuconfig` coincida exactamente
- **No reproduce audio**: Verifica que la URL de la emisora esté funcionando y que el formato sea compatible
- **Audio entrecortado**: Puede deberse a problemas de red o buffer insuficiente

## Contribuciones

¡Las contribuciones son bienvenidas! Si tienes alguna idea, mejora, o emisoras adicionales que agregar, no dudes en abrir un *Pull Request*.

## Licencia

Este proyecto está basado en los ejemplos del ESP-IDF y está bajo la Licencia Unlicense/CC0-1.0.