# FritzOs Rebooter Docker

- [Introduction](#introduction)
  - [Contributing](#contributing)
  - [Issues](#issues)
- [Getting started](#getting-started)
  - [Installation](#installation)
  - [Quickstart](#quickstart)
  - [Environment Variables](#environment-variables)
- [Additional Links](#additional-links)

# Introduction
Git-Repository to build [Docker Container](https://www.docker.com/) for rebooting FritzOs Devices like FritzBox or FritzRepeater. The Implementation is inspired by https://github.com/nicoh88/cron_fritzos-reboot.

This Docker Container use TR-064 protocol and should work with FritzOs greater than 6.x.


## Contributing
If you find this image helpfull, so you can see here how you can help:
- Create an new branch and send a pull request with your features and bug fixes
- Help users resolve their [issues](https://github.com/QuadStingray/docker-fritzos-rebooter/issues).

## Issues
Before reporting your issue please try updating Docker to the latest version and check if it resolves the issue. Refer to the Docker [installation guide](https://docs.docker.com/installation) for instructions.

If that recommendations do not help then [report your issue](https://github.com/QuadStingray/docker-fritzos-rebooter/issues/new) along with the following information:

- Output of the `docker version` and `docker info` commands
- The `docker run` command or `docker-compose.yml` used to start the
  image. Mask out the sensitive bits.

# Getting started
## Installation
Automated builds of the image are available on
[Dockerhub](https://hub.docker.com/r/quadstingray/fritzos-rebooter/)

```bash
docker pull quadstingray/fritzos-rebooter:1.0.0
```

Alternatively you can build the image yourself.
```bash
docker build . --tag 'quadstingray/fritzos-rebooter:dev';
```

## Quickstart
```bash
docker run -e "FRITZ_USER=myUserName" -e "FRITZ_PW=password" quadstingray/fritzos-rebooter:1.0.0
```

## Environment Variables

| Variable      | Default Value                | Informations                                                             |
|:--------------|:-----------------------------|:-------------------------------------------------------------------------|
| CRONS_LINES   | 30 6 * * *\|15 18 * * *      | Cron Lines seperated by `\|` Default: Rebooting at 6:30am and 6:30pm     |
| FRITZ_IPS     | 192.168.178.1                | IPs of Fritzboxes you want to reboot, also separated by ` \|`            |
| FRITZ_USER    | admin                        | Username of your Fritzbox Account                                        |
| FRITZ_PW      | FritzBoxUserPassword         | Password of your Fritzbox Account                                        |
| LOGGING       | true                         | Enable Logging to `/var/log/fritzbox/`                                   |
| TZ            | UTC                          | You can set you local Timezone like `Europe/Berlin`                      |

# Additional Links
* http://fritz.box:49000/tr64desc.xml
* https://wiki.fhem.de/wiki/FRITZBOX#TR-064
* https://avm.de/service/schnittstellen/
