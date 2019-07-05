# Raspberry Pi 3 - Dockerized OpenMediaVault - NAS it your self

[![GitHub tag](https://img.shields.io/github/tag/voldedore/docker-rpi-omv-build.svg)](https://github.com/voldedore/docker-rpi-omv-build/releases) [![Build Status](https://travis-ci.org/voldedore/docker-rpi-omv-build.svg?branch=master)](https://travis-ci.org/voldedore/docker-rpi-omv-build) [![Docker Pulls](https://img.shields.io/docker/pulls/voldedore/rpi-omv.svg)](https://hub.docker.com/r/voldedore/rpi-omv/)

*I recently stopped maintaining this repo due to a lack of time and RPI is not a proper idea for NAS, it's slow and the solution is somehow 'unstable'.*

*Used for running [built docker image](https://github.com/voldedore/docker-rpi-omv-build) via Resin.io*

Turn your Raspberry Pi to a NAS in 6 minutes*.

## Requirement

* A Raspberry Pi with at least 8GB microSD card.

## Installation (first time)

This image is designed and built to be used along with Resin.io

1. Create an account on Resin.io. If you've already had an account, of course, skip this step.
2. Create an application, e.g. named `my-app`
3. Clone this repo to your machine.
    ```
    $ git clone https://github.com/voldedore/docker-rpi-omv.git
    $ cd docker-rpi-omv
    ```
4. Add resin.io as 2nd remote for this repo.
    ```
    $ git remote add resin <USERNAME>@git.resin.io:<USERNAME>/my-app.git
    ```
5. Push to resin remote.
    ```
    $ git push resin master
    ```
6. Wait for your image build done.

    ```
    [Info]     Starting build for username/my-app, user name
    [Info]     Dashboard link: https://dashboard.resin.io/apps/my-app/devices
    [Info]     Building on arm02
    [Info]     Pulling old image for caching purposes
    [==================================================>] 100%
    [Success]  Cached image pulled in 28 seconds
    [Info]     Fetching base image
    [==================================================>] 100%
    [Info]     Building Standard Dockerfile project
    [Build]    Step 1/4 : FROM voldedore/rpi-omv:latest
    [Build]     ---> 13dfe0a54690
    [Build]    Step 2/4 : ENV VERSION 0.2.2
    [Build]     ---> Running in 9f35a9a2a7cd
    [Build]     ---> 11a6481be0d0
    [Build]    Removing intermediate container 9f35a9a2a7cd
    [Build]    Step 3/4 : LABEL maintainer "Vinh VO <voldedore@gmail.com>"
    [Build]     ---> Running in 5a7880642d2a
    [Build]     ---> acfee066c002
    [Build]    Removing intermediate container 5a7880642d2a
    [Build]    Step 4/4 : CMD /bin/bash
    [Build]     ---> Running in 507bfd03dfb3
    [Build]     ---> 922fb89c6613
    [Build]    Removing intermediate container 507bfd03dfb3
    [Build]    Successfully built 922fb89c6613
    [Build]    Successfully tagged registry2.resin.io:443/my-app/d8a7eb53c5a9affa39d334365d27b8102f8f1042:latest
    [Success]  Image created successfully
    [Info]     Verifying image integrity...
    [Success]  Image passed integrity checks!
    [Info]     Uploading image to registry...
    [==================================================>] 100%
    [Success]  Image uploaded successfully!
    [Info]     Check your dashboard for device download progress:
    [Info]       https://dashboard.resin.io/apps/my-app/devices
    [Info]     Build took 2 minutes and 38 seconds
    [Info]     630.92 MB total image size
                    \
                     \
                      \\
                       \\
                        >\/7
                    _.-(6'  \
                   (=___._/` \
                        )  \ |
                       /   / |
                      /    > /
                     j    < _\
                 _.-' :      ``.
                 \ r=._\        `.
                <`\\_  \         .`-.
                 \ r-7  `-. ._  ' .  `\
                  \`,      `-.`7  7)   )
                   \/         \|  \'  / `-._
                              ||    .'
                               \\  (
                                >\  >
                            ,.-' >.'
                           <.'_.''
                             <'
    ```

7. In the meantime, you can burn the ResinOS downloaded from your application home directory to your microSD card. Finally put the card in your RPI and boot. You should see your RPi appearing in the Dashboard, logging like:
    ```
    21.11.17 15:42:52 (+0700) Downloading application 'registry2.resin.io/my-app/d8a7eb53c5a9affa39d334365d27b8102f8f1042'
    21.11.17 15:48:16 (+0700) Downloaded application 'registry2.resin.io/my-app/d8a7eb53c5a9affa39d334365d27b8102f8f1042'
    21.11.17 15:48:21 (+0700) Installing application 'registry2.resin.io/my-app/d8a7eb53c5a9affa39d334365d27b8102f8f1042'
    21.11.17 15:48:22 (+0700) Installed application 'registry2.resin.io/my-app/d8a7eb53c5a9affa39d334365d27b8102f8f1042'
    21.11.17 15:48:22 (+0700) Starting application 'registry2.resin.io/my-app/d8a7eb53c5a9affa39d334365d27b8102f8f1042'
    21.11.17 15:48:23 (+0700) Started application 'registry2.resin.io/my-app/d8a7eb53c5a9affa39d334365d27b8102f8f1042'
    21.11.17 15:48:23 (+0700) Systemd init system enabled.
    21.11.17 15:48:24 (+0700) systemd 215 running in system mode. (+PAM +AUDIT +SELINUX +IMA +SYSVINIT +LIBCRYPTSETUP +GCRYPT +ACL +XZ -SECCOMP -APPARMOR)
    21.11.17 15:48:24 (+0700) Detected virtualization 'other'.
    21.11.17 15:48:24 (+0700) Detected architecture 'arm'.
    21.11.17 15:48:24 (+0700) Set hostname to <raspberrypi3-f3112aa>.
    21.11.17 15:48:24 (+0700) [159903.569953] quota-initial-check.sh[45]: Checking quotas...done.
    ```
8. Access to OpenMediaVault via local ip shown in the Dashboard (or via public IP). Cheers! 🥂
    
    Default ID `admin` and default password `openmediavault`
    
    
## Update installed application

1. First, pull this repo to your cloned directory.
    ```
    $ cd docker-rpi-omv
    $ git pull origin master
    ```
2. Then push to resin repo.
    ```
    $ git push resin master
    ```
3. Wait for image to be built.
4. Your device should download updated image shortly.

## About the `FROM` docker image

Please refer to [this repo](https://github.com/voldedore/docker-rpi-omv-build) for more information.

## Maintainer

Vinh VO <voldedore@gmail.com>


----
\* *depends on your internet connection speed*
