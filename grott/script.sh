#!/command/with-contenv bashio
# shellcheck shell=bash

bashio::log.info "Preparing to start..."

# Check if HA supervisor started
# Workaround for:
# - https://github.com/home-assistant/supervisor/issues/3884
# - https://github.com/zigbee2mqtt/hassio-zigbee2mqtt/issues/387
bashio::config.require 'data_path'

DATA_PATH=$(bashio::config 'data_path')
if ! bashio::fs.file_exists "$DATA_PATH/grott.ini"; then
    mkdir -p "$DATA_PATH" || bashio::exit.nok "Could not create $DATA_PATH"

    # Create an empty grott.ini
    touch "$DATA_PATH/grott.ini"
    bashio::log.info "Created config directory"

fi

# Follow shellcheck recommendations
if bashio::config.has_value 'verbose'; then
    # bug in grott code, see: https://github.com/johanmeijer/grott/pull/304
    gverbose="$(bashio::config 'verbose')"
    verbose="$(bashio::config 'verbose')"
    export gverbose
    export verbose
fi
if bashio::config.has_value 'gminrecl'; then
    gminrecl="$(bashio::config 'gminrecl')"
    export gminrecl
fi
if bashio::config.has_value 'gmode'; then
    gmode="$(bashio::config 'gmode')"
    export gmode
fi
if bashio::config.has_value 'ggrottip'; then
    ggrottip="$(bashio::config 'ggrottip')"
    export ggrottip
fi
if bashio::config.has_value 'ggrottport'; then
    ggrottport="$(bashio::config 'ggrottport')"
    export ggrottport
fi
if bashio::config.has_value 'gblockcmd'; then
    gblockcmd="$(bashio::config 'gblockcmd')"
    export gblockcmd
fi
if bashio::config.has_value 'gnoipf'; then
    gnoipf="$(bashio::config 'gnoipf')"
    export gnoipf
fi
if bashio::config.has_value 'gtime'; then
    gtime="$(bashio::config 'gtime')"
    export gtime
fi
if bashio::config.has_value 'gtimezone'; then
    gtimezone="$(bashio::config 'gtimezone')"
    export gtimezone
fi
if bashio::config.has_value 'gsendbuf'; then
    gsendbuf="$(bashio::config 'gsendbuf')"
    export gsendbuf
fi
if bashio::config.has_value 'gcompat'; then
    gcompat="$(bashio::config 'gcompat')"
    export gcompat
fi
if bashio::config.has_value 'gvalueoffset'; then
    gvalueoffset="$(bashio::config 'gvalueoffset')"
    export gvalueoffset
fi
if bashio::config.has_value 'ginverterid'; then
    ginverterid="$(bashio::config 'ginverterid')"
    export ginverterid
fi
if bashio::config.has_value 'gincludeall'; then
    gincludeall="$(bashio::config 'gincludeall')"
    export gincludeall
fi
if bashio::config.has_value 'ginvtype'; then
    ginvtype="$(bashio::config 'ginvtype')"
    export ginvtype
fi
if bashio::config.has_value 'gdecrypt'; then
    gdecrypt="$(bashio::config 'gdecrypt')"
    export gdecrypt
fi
if bashio::config.has_value 'ggrowattip'; then
    ggrowattip="$(bashio::config 'ggrowattip')"
    export ggrowattip
fi
if bashio::config.has_value 'ggrowattport'; then
    ggrowattport="$(bashio::config 'ggrowattport')"
    export ggrowattport
fi
if bashio::config.has_value 'gmqttip'; then
    gmqttip="$(bashio::config 'gmqttip')"
    export gmqttip
fi
if bashio::config.has_value 'gmqttport'; then
    gmqttport="$(bashio::config 'gmqttport')"
    export gmqttport
fi
if bashio::config.has_value 'gmqtttopic'; then
    gmqtttopic="$(bashio::config 'gmqtttopic')"
    export gmqtttopic
fi
if bashio::config.has_value 'gmqttauth'; then
    gmqttauth="$(bashio::config 'gmqttauth')"
    export gmqttauth
fi
if bashio::config.has_value 'gmqttuser'; then
    gmqttuser="$(bashio::config 'gmqttuser')"
    export gmqttuser
fi
if bashio::config.has_value 'gmqttpassword'; then
    gmqttpassword="$(bashio::config 'gmqttpassword')"
    export gmqttpassword
fi
if bashio::config.has_value 'gpvoutput'; then
    gpvoutput="$(bashio::config 'gpvoutput')"
    export gpvoutput
fi
if bashio::config.has_value 'gpvapikey'; then
    gpvapikey="$(bashio::config 'gpvapikey')"
    export gpvapikey
fi
if bashio::config.has_value 'gpvsystemid'; then
    gpvsystemid="$(bashio::config 'gpvsystemid')"
    export gpvsystemid
fi
if bashio::config.has_value 'gpvinverters'; then
    gpvinverters="$(bashio::config 'gpvinverters')"
    export gpvinverters
fi
if bashio::config.has_value 'ginflux'; then
    ginflux="$(bashio::config 'ginflux')"
    export ginflux
fi
if bashio::config.has_value 'ginflux2'; then
    ginflux2="$(bashio::config 'ginflux2')"
    export ginflux2
fi
if bashio::config.has_value 'gifdbname'; then
    gifdbname="$(bashio::config 'gifdbname')"
    export gifdbname
fi
if bashio::config.has_value 'gifip'; then
    gifip="$(bashio::config 'gifip')"
    export gifip
fi
if bashio::config.has_value 'gifport'; then
    gifport="$(bashio::config 'gifport')"
    export gifport
fi
if bashio::config.has_value 'gifuser'; then
    gifuser="$(bashio::config 'gifuser')"
    export gifuser
fi
if bashio::config.has_value 'gifpassword'; then
    gifpassword="$(bashio::config 'gifpassword')"
    export gifpassword
fi
if bashio::config.has_value 'giforg'; then
    giforg="$(bashio::config 'giforg')"
    export giforg
fi
if bashio::config.has_value 'gifbucket'; then
    gifbucket="$(bashio::config 'gifbucket')"
    export gifbucket
fi
if bashio::config.has_value 'giftoken'; then
    giftoken="$(bashio::config 'giftoken')"
    export giftoken
fi
if bashio::config.has_value 'ginvtypemap'; then
    ginvtypemap="$(bashio::config 'ginvtypemap')"
    export ginvtypemap
fi
if bashio::config.has_value 'gpvdisv1'; then
    gpvdisv1="$(bashio::config 'gpvdisv1')"
    export gpvdisv1
fi

if bashio::config.has_value 'grott_mqtt'; then
    if bashio::config.true 'grott_mqtt'; then
        export gnomqtt="False"
    else
        export gnomqtt="True"
    fi
fi

if bashio::config.true 'retain'; then
    MQTT_RETAIN="True"
else
    MQTT_RETAIN="False"
fi

# Expose addon configuration through environment variables.
function export_config() {
    local key=${1}
    local subkey

    if bashio::config.is_empty "${key}"; then
        return
    fi

    for subkey in $(bashio::jq "$(bashio::config "${key}")" 'keys[]'); do
        export "GROTT_CONFIG_$(bashio::string.upper "${key}")_$(bashio::string.upper "${subkey}")=$(bashio::config "${key}.${subkey}")"
    done
}

export_config 'mqtt'

# If the mqtt block is empty, but the mqtt service exists, use that.
if bashio::config.is_empty 'mqtt' && bashio::var.has_value "$(bashio::services 'mqtt')"; then
    GROTT_CONFIG_MQTT_HOST="$(bashio::services 'mqtt' 'host')"
    GROTT_CONFIG_MQTT_PORT="$(bashio::services 'mqtt' 'port')"
    GROTT_CONFIG_MQTT_USER="$(bashio::services 'mqtt' 'username')"
    GROTT_CONFIG_MQTT_PASSWORD="$(bashio::services 'mqtt' 'password')"
fi

if bashio::config.true 'ha_plugin'; then
    # pre configure the extension to use the integrated mosquitto broker
    gextension="True"
    gextname="grott_ha"
    # shellcheck disable=SC2089
    gextvar="{\"ha_mqtt_host\": \"$GROTT_CONFIG_MQTT_HOST\", \"ha_mqtt_port\": \"$GROTT_CONFIG_MQTT_PORT\", \"ha_mqtt_user\": \"$GROTT_CONFIG_MQTT_USER\", \"ha_mqtt_password\": \"$GROTT_CONFIG_MQTT_PASSWORD\", \"ha_mqtt_retain\": $MQTT_RETAIN}"
    export gextension
    export gextname
    # shellcheck disable=SC2090
    export gextvar
fi

# Auto configure the MQTT output if enabled
if bashio::config.true 'grott_mqtt'; then
    # if using the addon we are required to put an IP, we can't use a DNS
    if bashio::var.has_value "$(bashio::services 'mqtt')"; then
        GROTT_CONFIG_MQTT_HOST="$(dig "$GROTT_CONFIG_MQTT_HOST" +short)"
    fi
    export gmqttauth="True"
    export gmqttip="$GROTT_CONFIG_MQTT_HOST"
    export gmqttport="$GROTT_CONFIG_MQTT_PORT"
    export gmqttuser="$GROTT_CONFIG_MQTT_USER"
    export gmqttpassword="$GROTT_CONFIG_MQTT_PASSWORD"
fi

python -u grott.py -c "$DATA_PATH/grott.ini"
