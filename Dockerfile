FROM resin/rpi-raspbian

LABEL maintainer="voldedore"

RUN echo "deb http://mirrors.vinahost.vn/raspbian/raspbian jessie main contrib non-free rpi firmware" > /etc/apt/sources.list

RUN apt-get update

RUN apt-get install apt-utils wget dialog

RUN echo "deb http://packages.openmediavault.org/public erasmus main" | sudo tee -a /etc/apt/sources.list.d/openmediavault.list
RUN wget -O - http://packages.openmediavault.org/public/archive.key | apt-key add -

RUN apt-get update

RUN apt-get install openmediavault-keyring postfix php-apc perl libjs-extjs6 php5-fpm libpam-modules php5-cgi php5-cli php5-pam sudo ethtool python3-dialog acl ifenslave iproute2 xfsprogs jfsutils ntfs-3g hdparm sdparm ifupdown mdadm postfix libsasl2-modules bsd-mailx python3-dbus cpufrequtils rsyslog logrotate smartmontools openssl openssh-server openssh-blacklist-extra uuid tzdata nfs-kernel-server proftpd-basic wget util-linux samba samba-common-bin rsync apt-utils net-tools snmpd avahi-daemon libnss-mdns iptables monit acpid beep gdisk rrdtool collectd cron anacron cron-apt quota quotatool whiptail lvm2 watchdog ca-certificates perl libjson-perl liblocale-po-perl proftpd-mod-vroot libjavascript-minifier-xs-perl coreutils xmlstarlet mount parted bash diffutils lsof socat rrdcached locales nginx bash-completion python3 python3-apt pm-utils wpasupplicant systemd systemd-sysv samba-vfs-modules pciutils python3-pyudev python3-natsort jq ntp python3-netifaces udev apt-transport-https python3-lxml btrfs-tools debconf init-system-helpers

RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections
RUN apt-get install openmediavault

RUN wget http://omv-extras.org/debian/pool/main/o/openmediavault-omvextrasorg/openmediavault-omvextrasorg_3.3.3_all.deb
RUN dpkg -i openmediavault-omvextrasorg_3.3.3_all.deb
#RUN omv-initsystem

ENV STORAGE_LABEL
ARG STORAGE_LABEL=VTVINH

RUN echo '[Unit] \n\
Description = External SD Card \n\
\n\
[Mount] \n\
What = LABEL=$STORAGE_LABEL \n\
Where = /mnt/storage/$STORAGE_LABEL \n\
Type = ext4 \n\
Options = rw,relatime,data=ordered \n\
\n\
[Install] \n\
WantedBy = multi-user.target" > mnt-storage.mount

RUN systemctl enable mnt-storage.mount

CMD ["/bin/sh"]
#CMD ["omv-initsystem"]
