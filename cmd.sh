#!/usr/bin/env bash

echo "Kick dehydrated ... "
/srv/dehydrated/dehydrated \
    --cron \
    --accept-terms \
    --hook /etc/dehydrated/hook.sh \
    --challenge dns-01

echo "Current certificates ... "
ls /etc/certificates -1