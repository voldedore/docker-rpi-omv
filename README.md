# Raspberry Pi 3 - Dockerized OpenMediaVault 3.3 - NAS it your self

Used for running built docker image via Resin.io

## How to use

1. Create an account on Resin.io
2. Create an application, e.g. named `my-app`
3. Clone this repo to your machine
    ```
    git clone https://github.com/voldedore/docker-rpi-omv.git
    ```
4. Add resin.io as 2nd remote for this repo.
    ```
    git remote add resin <USERNAME>@git.resin.io:<USERNAME>/my-app.git
    ```
5. Push to resin remote
    ```
    git push resin master
    ```
6. Wait for your image build done; then burn ResinOS downloaded from your application home directory to your microSD card. Finally put the card in your RPI and boot.
