## Plex+yaVDR Docker image ##

This is based on the work of needo's image, who himself based his work upon 
Eric Schultz <eric@startuperic.com> and the images from Tim Haak <tim@haak.co.uk>

It basically setups an image with plex (for plexpass users) and adds in the
2 existing bundles to connect Plex with yaVDR.

a) LiveTV by myself
b) VDR.Bundle by Dariush Forouher and Friedhelm Buescher

Links to learn about the pieces installed:

* plex with plexpass - http://plex.tv/
* VDR.bundle - https://github.com/forouher/VDR.bundle 
* plex-vdr-live-tv.bundle https://github.com/Jondalar/plex-vdr-live-samsung-tv-plugin.bundle

Build:

check this out to any convient place, I used /usr/local/src/dockerfiles

Then run

docker build -t jondalar/plexvdr /usr/local/src/dockerfiles/plex/

Run:

To run the latest plexpass version:

```
docker run -d --net="host" --name="plex" -v /path/to/plex/config:/config -v /path/to/video/files:/data -v /etc/localtime:/etc/localtime:ro -p 32400:32400 needo/plex
```

If you would like to specify a specific version of plex to run:

```
docker run -d --net="host" --name="plex" -v /path/to/plex/config:/config -v /path/to/video/files:/data -v /etc/localtime:/etc/localtime:ro -e VERSION=0.9.9.8.436-8abe5c0 -p 32400:32400 needo/plex
```

NOTE: It *must* be the full version name (i.e. 0.9.9.8.436-8abe5c0) replace with the version you desire in the command above

Example for my yaVDR installation:

docker run -d --net="host" --name="plex" -v /usr/local/docker-configs:/config -v /srv/vdr/video.00/AVIs:/data -v /srv/vdr/video.00/Filme:/recordings -v /etc/localtime:/etc/localtime:ro -p 32400:32400 jondalar/plexvdr


After install go to:

http://server:32400/web/index.html#!/dashboard and login with your myPlex credentials



## A note to docker-images for the VDR community: ##

Once the docker container has started with "run", you only need to start/stop/restart it with "docker start" e.g. It will keep the parameters 
Install something like dockerui in case you want to have a little comfort.

