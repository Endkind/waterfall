# Waterfall - All Versions

This Docker image provides Waterfall Minecraft Proxy versions. You can easily run a Minecraft Proxy using this image.

## Quick start

```bash
docker run -it -d -p 25565:25577 --name endkind-waterfall endkind/waterfall:latest
```

This command starts a Waterfall server in detached mode (-d), maps port 25565 from the host to the container.

## Installation and Configuration (Recommended)

```bash
docker volume create endkind-waterfall

docker run -it -d -p 25565:25577 --name endkind-waterfall -v endkind-waterfall:/waterfall --restart=always endkind/waterfall:latest
```

## Using Specific Versions

When deploying your server for production or if you require version stability, consider using specific image versions. For example:

### Waterfall 1.19

```bash
docker run -it -d -p 25565:25577 endkind/waterfall:1.19
```

By specifying a version like 1.19, you ensure that your server runs a known and tested version of Waterfall.

### All Supported Versions

- `latest` uses always the newest version
- `1.19`
- `1.18`
- `1.17`
- `1.16`
- `1.15`
- `1.14`
- `1.13`
- `1.12`
- `1.11`

## Environment variables

You can customize your Waterfall server by setting the following environment variables:

- `MIN_RAM` (default: 32M) - Minimum RAM allocated for the server.
- `MAX_RAM` (default: 512M) - Maximum RAM allocated for the server.
- `JAVA_FLAGS` - Additional Java flags generated with [flags.sh](https://flags.sh/).
- `WATERFALL_FLAGS` (default: --nojline) - Custom Waterfall server flags.
- `TZ` (example: Europe/Berlin) - Set the time zone for the server.

These environment variables allow you to tailor your Waterfall server's configuration to your specific requirements. You can adjust memory allocation, specify custom Java flags, and configure various server settings to suit your needs.

## How to build

Replace `<version>` with the desired version.

```bash
docker build --build-arg WATERFALL_VERSION=<version> -t endkind/waterfall:<version> .
```

## Additional Information

- [GitHub Repository](https://github.com/Endkind/waterfall)
- [Docker Repository](https://hub.docker.com/r/endkind/waterfall)
- [Docker Compose Example](https://github.com/Endkind/waterfall/blob/main/docker-compose.yml)
- [Visit our website](https://www.endkind.net) for more information about our projects and services.
- Connect to our Minecraft server (crossplay) at `mc.endkind.net` and start your adventure!

## License

This project is licensed under the terms of the [MIT](https://github.com/Endkind/waterfall/blob/latest/LICENSE) License.

### Other License

This project includes code derived from the [PaperMC](https://github.com/PaperMC/Paper) project.
