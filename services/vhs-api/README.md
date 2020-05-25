# VHS Ops Scripts

Just a collection of scripts used by VHS for operations

# Notes

#### Updating Discourse (https://talk.vanhack.ca)

Normally go to https://talk.vanhack.ca/admin/upgrade to upgrade.

If anything bad[TM] happens and running the upgrade procedure again does not work, use these instructions:

To update the Discourse software for talk.vanhack.ca, ssh into talk.vanhack.ca do the following steps as root:

    cd /var/discourse
    git pull
    ./launcher rebuild app

The last step may take about 15 minutes, and Discourse will be unavailable during that time. Users will see
a '502 Bad Gateway' message from nginx while the rebuild is happening.

If the rebuild succeeds but Talk does not come back up, you may need to force nginx to be re-created and
re-linked:

    /var/docker-vhs-nginx/create.sh -f
