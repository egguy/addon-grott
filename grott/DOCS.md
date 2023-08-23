# Grott - Home Assistant native MQTT integration

## Installation

1. If you don't have an MQTT broker yet; in Home Assistant go to **Settings → Add-ons → Add-on store** and install the **Mosquitto broker** addon.
1. Go back to the **Add-on store**, click **⋮ → Repositories**, fill in</br> `https://github.com/egguy/grott-home-assistant-add-on` and click **Add → Close** or click the **Add repository** button below, click **Add → Close** (You might need to enter the **internal IP address** of your Home Assistant instance first).
   [![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fegguy%2Fgrott-home-assistant-add-on)
1. The repository includes two add-ons:
   - **grott** is the stable release that tracks the released versions of grott HA plugin.
   - **grott Edge** tracks the `dev` branch of grott HA plugin such that you can install the edge version if there are features or fixes in the grott HA dev branch that are not yet released. (**recommended for most users**)
1. Click on the addon and press **Install** and wait till the addon is installed.
1. Click on **Configuration**

   - If you are **not** using the Mosquitto broker addon fill in your MQTT details (leave empty when using the Mosquitto broker addon). Format is e.g.: <br>

     ```yaml
     host: <IP>
     port: 1883
     user: my_user
     password: my_password
     ```

   - Click **Save**
   - **Tip:** it is possible to refer to variables in the Home Assistant `secrets.yaml` file by using e.g. `password: '!secret mqtt_pass'`

1. If multiple inverters, please refer on how to configure them on this documentation: <https://github.com/johanmeijer/grott/wiki/Multi-Inverter-support>
1. Start the addon by going to **Info** and click **Start**
1. Configure your data logger using the information contained here: [Rerouting Growatt Wifi TCPIP data via your Grott Server](https://github.com/johanmeijer/grott/wiki/Rerouting-Growatt-Wifi-TCPIP-data-via-your-Grott-Server)
   - Use the local IP of your home assistant
   - Don't use a DNS, the datalogger can't resolve `homeassistant.local`
