# Raspberry Pi 3 - Dockerized OpenMediaVault - NAS it your self

[![GitHub tag](https://img.shields.io/github/tag/voldedore/docker-rpi-omv-build.svg)](https://github.com/voldedore/docker-rpi-omv-build/releases) [![Build Status](https://travis-ci.org/voldedore/docker-rpi-omv-build.svg?branch=master)](https://travis-ci.org/voldedore/docker-rpi-omv-build) [![Docker Pulls](https://img.shields.io/docker/pulls/voldedore/rpi-omv.svg)](https://hub.docker.com/r/voldedore/rpi-omv/)

*Used for running [built docker image](https://github.com/voldedore/docker-rpi-omv-build) via Resin.io*

Turn your Raspberry Pi to a NAS in 6 minutes*.

## Requirement

* A Raspberry Pi with at least 8GB microSD card.

## Installation

This image is designed and built to be used along with Resin.io

1. Create an account on Resin.io. If you've already had an account, of course, skip this step.
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
6. Wait for your image build done; in the meantime burn the ResinOS downloaded from your application home directory to your microSD card. Finally put the card in your RPI and boot.

## About the `FROM` docker image

Please refer to [this repo](https://github.com/voldedore/docker-rpi-omv-build) for more information.

## Maintainer

Vinh VO <voldedore@gmail.com>


----
\* *depends on your internet connection speed*
