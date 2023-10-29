# Waterfall - All Versions

This Docker image provides Waterfall Minecraft Proxy versions. You can easily run a Minecraft Proxy using this image.


## Quick start

```bash
docker run -it -d -p 25565:25577 --name endkind-waterfall endkind/waterfall:latest
```
This command starts a Waterfall server in detached mode (-d), maps port 25565 from the host to the container.


## Installation and Configuration (Recommended)

```bash
docker volume create <servername>

docker run -it -d -p 25565:25577 --name <servername> -v <servername>:/waterfall --restart=always endkind/waterfall:latest
```


## Using Specific Versions

When deploying your proxy for production or if you require version stability, consider using specific image versions. For example:

### Waterfall 1.19
```bash
docker run -it -d -p 25565:25565 --name endkind-waterfall endkind/waterfall:1.19
```

By specifying a version like 1.19, you ensure that your server runs a known and tested version of Waterfall.

### All Supported Cersions
- `latest` uses always the newest version
- `1.20`
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
- `PAPERMC_FLAGS` (default: --nojline) - Custom Waterfall server flags.
- `TZ` (example: Europe/Berlin) - Set the time zone for the server.

These environment variables allow you to tailor your Waterfall server's configuration to your specific requirements. You can adjust memory allocation, specify custom Java flags, and configure various server settings to suit your needs.


## Additional Information

- [GitHub Repository](https://github.com/Endkind/waterfall)
- [Visit our website](https://www.endkind.net) for more information about our projects and services.
- Connect to our Minecraft server (crossplay) at `mc.endkind.net` and start your adventure!


## LICENSE

MIT License

Copyright (c) 2023 Endkind Ender <endkind.ender@endkind.net>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.