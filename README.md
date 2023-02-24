# Symfony Docker

A [Docker](https://www.docker.com/)-based installer and runtime for the [Symfony](https://symfony.com) web framework, with full [HTTP/2](https://symfony.com/doc/current/weblink.html), HTTP/3 and HTTPS support.

![CI](https://github.com/dunglas/symfony-docker/workflows/CI/badge.svg)

## Getting Started

1. If not already done, [install Docker Compose](https://docs.docker.com/compose/install/) and [install mkcert to generate SSL/TLS certificates](https://github.com/FiloSottile/mkcert)
2. Run `chmod 777 ./cli.sh` to grant permissions to the CLI script
3. Run `./cli.sh build --start` to build and start new project

**Enjoy!**

## Docs

1. [CLI docs](docs/build.md)

## License

Symfony Docker is available under the MIT License.

## Credits

Created by [Mateusz Skrzypiec | Arkadiusz Palka | Dawid Michalec](https://dunglas.fr)