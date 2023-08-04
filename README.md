# EPICS IOC for High Voltage Power Supply

This repository contains the High Voltage Power Supply (HVPS) EPICS Input/Output
Controller (IOC).

## Building the Docker image

In order to build the Docker image, you can execute the following command

```bash
docker compose build
```

## Instantiating a Docker container

For instantiating a Docker container, execute the following command properly
filling the environment variables.

```bash
docker run --name <NAME> --net host -d -e BEAMLINE=<BEAMLINE> -e HUTCH=<HUTCH> \
-e HVPS_IP_ADDRESS=<HVPS_IP_ADDRESS> -e HVPS_PORT=<HVPS_PORT> hvps-epics-ioc
```

## Accessing the IOC Shell

By default, `st.cmd` will run under `procServ` inside the container, which will
create a `ioc.sock` stream Unix socket in the container working directory that
can be used to access the IOC shell.
