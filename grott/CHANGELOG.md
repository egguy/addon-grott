# Changelog

## 0.1.11

- ⬆️ Updated the version of grott used to 20240722 @egguy (#71)

## 0.1.10

### 🚀 Enhancements

- Updated add-on title @egguy (#50)
- Update the version of grott @egguy, add support for inverter fan (#55)

## 0.1.9

- Use the 2.8 version of grott as it is considered the stable branch

## 0.1.8

- Add support for expiring entities

If the add-on doesn't receive data for an inverter for more than 15 minutes (e.g. turned off at night). It is considered disconnected. This prevents having phantom production at night when the inverter turn off.

- Add testing for the CI (prevent missing dig package)

## 0.1.7

- Updated documentation

## 0.1.6

- Switched to the new grott ha python plugin
  Use the new pypi grott_ha plugin instead of embedding it in the addon.

## 0.1.5

- Change addon name

## 0.1.4

- Updated the deployment system

## 0.1.3

- Add action to update the old repository

## 0.1.2

- Curl update to prevent CVE

## 0.1.1

- Updated the image
- Use the stable branch
- Use automatic packaging

## 0.1.0

- Add the missing dig dependency

## 0.8

Added an option to improve compatibility with [grott homeassistant integration](https://github.com/muppet3000/homeassistant-grott).

To activate this mode, you can disable the HA integration in the configuration and enable the grott_mqtt flag. This will configure the MQTT for pushing information through the grott MQTT exporter.

## 0.7

2.7

- Add new options for configuration
  - Verbose mode
  - MQTT retain
  - data path, now you can edit your configuration in /config/grott/grott.ini
  - Allow custom MQTT broker

## 0.6

- Updated the branch used by grott

## 0.5

- Change to use pip3 with the newest addon image.

## 0.3

- Add translations
- Moved the ginvtypemap to the top configuration

## 0.2

- Based on grott v2.7.7
- use the current grott_ha.py plugins
- Auto configuration for the MQTT part

## 0.1

- Initial version
- Based on grott v2.7.6
