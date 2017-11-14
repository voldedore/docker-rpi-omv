FROM resin/armv7hf-debian

LABEL maintainer="voldedore"

RUN [ "cross-build-start" ]

#RUN echo "deb http://mirrors.vinahost.vn/raspbian/raspbian jessie main contrib non-free rpi firmware" > /etc/apt/sources.list

RUN apt-get update

RUN apt-get install --force-yes wget
RUN apt-get install dialog
RUN apt-get install apt-utils



RUN echo "deb http://packages.openmediavault.org/public erasmus main" | sudo tee -a /etc/apt/sources.list.d/openmediavault.list
RUN wget -O - http://packages.openmediavault.org/public/archive.key | apt-key add -

RUN apt-get install openmediavault-keyring
RUN apt-get install postfix
RUN apt-get -f install php-apc
RUN apt-get install perl
RUN apt-get install libjs-extjs6
RUN apt-get install php5-fpm
RUN apt-get install libpam-modules
RUN apt-get install php5-cgi
RUN apt-get install php5-cli
RUN apt-get install php5-pam
RUN apt-get install sudo
RUN apt-get install ethtool
RUN apt-get install python3-dialog
RUN apt-get install acl
RUN apt-get install ifenslave
RUN apt-get install resolvconf
RUN apt-get install iproute2
RUN apt-get install xfsprogs
RUN apt-get install jfsutils
RUN apt-get install ntfs-3g
RUN apt-get install hdparm
RUN apt-get install sdparm
RUN apt-get install ifupdown
RUN apt-get install mdadm
RUN apt-get install postfix
RUN apt-get install libsasl2-modules
RUN apt-get install bsd-mailx
RUN apt-get install python3-dbus
RUN apt-get install cpufrequtils
RUN apt-get install rsyslog
RUN apt-get install logrotate
RUN apt-get install smartmontools
RUN apt-get install openssl
RUN apt-get install openssh-server
RUN apt-get install openssh-blacklist-extra
RUN apt-get install uuid
RUN apt-get install tzdata
RUN apt-get install nfs-kernel-server
RUN apt-get install proftpd-basic
RUN apt-get install wget
RUN apt-get install util-linux
RUN apt-get install samba
RUN apt-get install samba-common-bin
RUN apt-get install rsync
RUN apt-get install apt-utils
RUN apt-get install net-tools
RUN apt-get install snmpd
RUN apt-get install avahi-daemon
RUN apt-get install libnss-mdns
RUN apt-get install iptables
RUN apt-get install monit
RUN apt-get install acpid
RUN apt-get install beep
RUN apt-get install gdisk
RUN apt-get install rrdtool
RUN apt-get install collectd
RUN apt-get install cron
RUN apt-get install anacron
RUN apt-get install cron-apt
RUN apt-get install quota
RUN apt-get install quotatool
RUN apt-get install whiptail
RUN apt-get install lvm2
RUN apt-get install watchdog
RUN apt-get install ca-certificates
RUN apt-get install perl
RUN apt-get install libjson-perl
RUN apt-get install liblocale-po-perl
RUN apt-get install proftpd-mod-vroot
RUN apt-get install libjavascript-minifier-xs-perl
RUN apt-get install coreutils
RUN apt-get install xmlstarlet
RUN apt-get install mount
RUN apt-get install parted
RUN apt-get install bash
RUN apt-get install diffutils
RUN apt-get install lsof
RUN apt-get install socat
RUN apt-get install rrdcached
RUN apt-get install locales
RUN apt-get install nginx
RUN apt-get install bash-completion
RUN apt-get install python3
RUN apt-get install python3-apt
RUN apt-get install pm-utils
RUN apt-get install wpasupplicant
RUN apt-get install systemd
RUN apt-get install systemd-sysv
RUN apt-get install samba-vfs-modules
RUN apt-get install pciutils
RUN apt-get install python3-pyudev
RUN apt-get install python3-natsort
RUN apt-get install jq
RUN apt-get install ntp
RUN apt-get install python3-netifaces
RUN apt-get install udev
RUN apt-get install apt-transport-https
RUN apt-get install python3-lxml
RUN apt-get install btrfs-tools
RUN apt-get install debconf
RUN apt-get install init-system-helpers
#RUN echo $(apt-cache depends openmediavault | grep Depends | sed "s/.*ends:\ //" | tr '\n' ' ')


RUN omv-initsystem

RUN [ "cross-build-end" ]

CMD ["/bin/sh"]
