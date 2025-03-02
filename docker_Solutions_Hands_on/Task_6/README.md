## Task 6: Persist Data with Docker Volumes

1) Create a Docker Volume:
   * Create a Docker Volume
     ```bash
       ubuntu@MYLINUXEC2:/opt/docker/weather-app$ docker volume create weather-data
        weather-data


     ``` 
   * List Docker volume
     ``` bash
        ubuntu@MYLINUXEC2:/opt/docker/weather-app$ docker volume ls | grep -i weather
        local     weather-data

     ```
   * Inspect a Docker volume
     ``` bash
     ubuntu@MYLINUXEC2:/opt/docker/weather-app$ docker volume  inspect weather-data
        [
        {
        "CreatedAt": "2025-03-02T15:53:50Z",
        "Driver": "local",
        "Labels": null,
        "Mountpoint": "/var/lib/docker/volumes/weather-data/_data",
        "Name": "weather-data",
        "Options": null,
        "Scope": "local"
        }
        ]
     ```


 2)  Run a Container with the Volume:
     * Run a container using the volume to persist data
  ``` bash 
    ubuntu@MYLINUXEC2:/opt/docker/weather-app$ docker buntu@MYLINUXEC2:/opt/docker/weather-app$ docker run -d -p 3000:3000 -v weather-data:/sam/data weather-img:single
    c3c4178f5e98b90458dd871b7d93a23f4e4c23711830a521fdd023d9e47f11cb
```
* Test volume persistence: 
  * Access container via `-it` and store data, stop & delete docker & run again data should still exists under volume
```bash
    docker exec -it c3c4178f5e98 bash
    root@c3c4178f5e98:/sam# cd data/
    root@c3c4178f5e98:/sam/data# ls -ltr
   total 0
    -rw-r--r-- 1 root root 0 Mar  2 16:18 inside_the_container
    -rw-r--r-- 1 root root 0 Mar  2 16:19 outside_the_container

```





## Docker Volumes: Data Persistence and Usefulness

Docker volumes are a critical feature for managing data in containerized environments. 
They ensure data persistence, enable data sharing, and simplify workflows. Below is a concise explanation of how Docker volumes help with data persistence and why they are useful.
## How Docker Volumes Help with Data Persistence

1. **Decouple Data from Containers**  
   Docker volumes store data outside the container's filesystem. This means data persists even if the container is stopped, deleted, or replaced.

2. **Survive Container Lifecycle**  
   Containers are ephemeral, but volumes are not. Data stored in volumes remains intact across container restarts or updates.

3. **Enable Data Sharing**  
   Volumes can be shared among multiple containers, allowing seamless data exchange. For example, a database container and a backup container can use the same volume.

4. **Simplify Backups and Migrations**  
   Since volumes are stored on the host system, they can be easily backed up, restored, or migrated to another host or environment.

5. **Improve Performance**  
   Volumes are optimized for containerized workloads and often provide better performance compared to other storage options like bind mounts.


---