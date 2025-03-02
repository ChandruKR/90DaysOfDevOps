## 🚀 Task 5: Manage Your Image with Docker Hub


### Tag Your Image:
* Tag your image appropriately
  ```bash
  ubuntu@MYLINUXEC2:/opt/docker/weather-app$ docker tag weather-img:single chandrukr39/weather-img:latest
    ubuntu@MYLINUXEC2:/opt/docker/weather-app$ docker images | grep -i weath
    chandrukr39/weather-img   latest    f7e34d6a2227   About an hour ago   138MB
    weather-img               single    f7e34d6a2227   About an hour ago   138MB


  ```

### Push Your Image to Docker Hub:
* Log in to Docker Hub if necessary:
  ```bash

  docker login -u # Generate PAT from Docker HUB

  ubuntu@MYLINUXEC2:/opt/docker/weather-app$ docker login
   Authenticating with existing credentials...
   WARNING! Your password will be stored unencrypted in /home/ubuntu/.docker/config.json.
    Configure a credential helper to remove this warning. See
   https://docs.docker.com/engine/reference/commandline/login/#credentials-store

    Login Succeeded
  ```


* Push the image
  ```bash
  ubuntu@MYLINUXEC2:/opt/docker/weather-app$ docker push chandrukr36/weather-img
    Using default tag: latest
    The push refers to repository [docker.io/chandrukr36/weather-img]
    56f529242abd: Pushed
    7014b30d7c26: Pushed
    49947f9181cd: Pushed
    
    latest: digest: size: 1990
  ```

### Pull the Image:
* Verify by pulling your image
  ```bash
   docker pull chandrukr36/weather-img
  ```
