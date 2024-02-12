# Grott - Home Assistant native MQTT integration

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->

<!-- code_chunk_output -->

- [Grott - Home Assistant native MQTT integration](#grott---home-assistant-native-mqtt-integration)
  - [Requirements](#requirements)
  - [Configuration of the Wi-Fi logger](#configuration-of-the-wi-fi-logger)
  - [Configuration](#configuration)
    - [Specific inverter configuration](#specific-inverter-configuration)
    - [Multiple inverters configuration](#multiple-inverters-configuration)
    - [External MQTT broker](#external-mqtt-broker)
    - [Compatibility with homeassistant-grott](#compatibility-with-homeassistant-grott)
  - [Configuration of grott](#configuration-of-grott)
    - [PVOuput](#pvouput)

<!-- /code_chunk_output -->

## Requirements

- A MQTT broker (e.g. the Mosquitto broker add-on)
  - If you don't have an MQTT broker yet; in Home Assistant go to **Settings → Add-ons → Add-on store** and install the **Mosquitto broker** add-on.
- A Growatt inverter with a Wi-Fi module

## Configuration of the Wi-Fi logger

The IP to use is the IPv4 of home assistant. You can't use the DNS of home assistant. You need to use the IPv4.

You can find this information in: **settings → system → network**, on **Configure network interfaces** click on the three dots and choose **IP Information**. You will see the IPv4 address.

The IP address to use is the field **IP Address**. You need to remove the /XX at the end of the IP address. e.g.: **IP Address: 192.168.20.2/24** -> IP address to use: **192.168.20.2**

Here some resources to configure your Wi-Fi logger:

- [Rerouting Growatt Wi-Fi TCPIP data via your Grott Server](https://github.com/johanmeijer/grott/wiki/Rerouting-Growatt-Wifi-TCPIP-data-via-your-Grott-Server)
- [Muppet3000 guide to reconfigure the stick](https://github.com/muppet3000/homeassistant-grott/blob/main/docs/setup/datalogger.md)

## Configuration

If you do a change of configuration. It is important to save and then restart the add-on.

### Specific inverter configuration

If you have multiple inverters, please refer to how to configure them in this documentation: [Multiple inverters configuration](#multiple-inverters-configuration)

In the case you have one of the listed inverter types, you need a special configuration:

- SPH
  - SPH6000, SPH3000...
- SPF
  - SPF5000, SPF3000...
- TL3
  - TL3-X...
- MAX
  - MAX 100-150KTL3-X...

The support for these inverters is available in grott 2.8

- SPA
  - SPA 4000-10000TL3
- MIN
  - MIN 2500-6000TL

The setting to change is inverter type. You need to put the 3 letters of the inverter type in the configuration.

e.g:

- SPH6000 -> SPH
- SPF5000 -> SPF
- TL3-X -> TL3
- MAX 100-150KTL3-X -> MAX
- SPA 4000-10000TL3 -> SPA
- MIN 2500-6000TL -> MIN

### Multiple inverters configuration

In the case of multiple inverters, you need to configure the inverter details in the add-on configuration. If you have only one inverter, you can leave the inverter details empty. Use the inverter type as described in the [Specific inverter configuration](#specific-inverter-configuration) section.

You will have to get the serial number of the inverter. To achieve this, you can run grott in verbose mode and check the logs. You will see the serial number of the inverter in the logs.

You can keep the default value for `invertype`, it will override it.

The format is e.g.:

```json
{ "SERIAL": "TYPE", "SERIAL": "TYPE" }
```

It is important to respect the quotes and the comma to separate the inverters.

e.g.:

```json
{ "NWO00415E3": "SPH", "DFO1231952": "MAX" }
```

### External MQTT broker

If you are using an external MQTT broker, you need to configure the MQTT broker details in the add-on configuration. If you are using the Mosquitto broker add-onn, you can leave the MQTT broker details empty.

1. Click on **Configuration**
   **If you are not using the Mosquitto broker add-on** fill in your MQTT details (leave empty when using the Mosquitto broker add-on). The format is e.g.: <br>

   ```yaml
   host: <IP>
   port: 1883
   user: my_user
   password: my_password
   ```

### Compatibility with homeassistant-grott

Muppet3000 has created a custom component for Home Assistant. This component is called [homeassistant-grott](https://github.com/muppet3000/homeassistant-grott). It is compatible with this add-on.

You can use the add-on and the component at the same time. This will make the deployment of grott and configuration a bit easier.

You can activate the compatibility mode by checking: **Enable grott MQTT** in the configuration, and then follow the instruction to install and activate the extension.

It is recommended to deactivate the **Home Assistant plugin** in the configuration. This can lead to duplicate sensors.

## Configuration of grott

The add-on creates a folder in home assistant. You can find it in the `/addon_configs/grott/` folder of your home assistant instance.

You can create/modify the `grott.ini` using the file editor add-on or VS Code add-on. This allows you to add pvoutput support or to add a custom JSON layout.

### PVOuput

[How to configure PVOutput](https://github.com/johanmeijer/grott/wiki/PVOutput.org-support)
