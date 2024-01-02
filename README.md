# stable-d
Simple dockerization of easy diffusion

https://github.com/easydiffusion/easydiffusion

A git-clone and docker-compose up -d should bring it up. The code at the bottom should do it for my standard of doing things.  

Because of how I built this, it has to download the entire thing the first run, so said first run will take something like 10 minutes or so. It places all the data the setup script needs in the same local directory. You can monitor the container logs for status.

This is set to run on 8505, not 9000 like the OG project. Portainer makes docker really not like port 9000, so yea...

This should get it going. Let's say you keep your docker-compose's organized in /media/pool-0/[app-name]/docker-compose.yaml with all the other stuff needed in the [app-name] folder. If so, then this code block should get it going. 

```
git clone https://github.com/phermeys/stable-d.git /media/pool-0/stable-d/
cd /media/pool-0/stable-d/
docker-compose up -d
```
