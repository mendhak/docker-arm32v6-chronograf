Chronograf Docker iamge for Raspberry Pi Zero.  The Raspberry Pi zero is ARM32v6, and there are no official images for that specific architecture. 

### Running it

Use docker-compose, together with Influx

```

version: '3.7'

services:
    influxdb:
        image: mendhak/arm32v6-influxdb
        container_name: influxdb
        ports:
            - 8086:8086
        volumes:
            - ./influxdbdata:/root/.influxdb/data/
            - ./influxdbbackups:/backups/

    chronograf:
        image: mendhak/arm32v6-chronograf
        container_name: chronograf
        ports:
            - 80:8888
        command: chronograf --influxdb-url=http://influxdb:8086 --bolt-path /chronografdata/bolt.db
        volumes:
            - ./chronografdata:/chronografdata/


```

Then run it

```
docker-compose up -d
```

It takes up to 5 minutes for Chronograf to get started! 


Running directly:


docker run -d -p 8888:8888 --rm -it mendhak/arm32v6-chronograf chronograf --influxdb-url=http://zero:8086 --bolt-path /chronografdata/bolt.db



### Building it

DockerHub does not build ARM images, it must be pushed manually. 

docker build -t mendhak/arm32v6-chronograf:1.8.4-1 .
