#!/bin/sh

printf "\nCreating directories and logfiles\n"
[ ! -d /var/sboutils/repositories ] && mkdir -pv /var/sboutils/repositories
[ ! -d /var/log/sboutils ] && mkdir -pv /var/log/sboutils
[ ! -e /var/log/sboutils/installed_packages ] && touch /var/log/sboutils/installed_packages

printf "\nChanging all permissions to root:root\n"
printf "If you are updating sboutils, this may take a while\n"
chown -Rv root:root /var/log/sboutils /var/sboutils /etc/sboutils
chown -Rv root:root /usr/local/sbin/sboutil /usr/local/sbin/installsbo /usr/local/sbin/removesbo
chown -Rv root:root /usr/local/man/man8/installsbo.8 /usr/local/man/man8/removesbo.8 /usr/local/man/man8/sboutil.8 usr/local/man/man8/sboutils.8

printf "\nAdding execute permissions\n"
chmod -v 755 /usr/local/sbin/sboutil /usr/local/sbin/installsbo /usr/local/sbin/removesbo

printf "\nInstalling manpages\n"
gzip -v /usr/local/man/man8/installsbo.8 /usr/local/man/man8/removesbo.8 /usr/local/man/man8/sboutil.8 usr/local/man/man8/sboutils.8

printf "\nRemoving spare files\n"
[ -e /README ] && rm -v /README
