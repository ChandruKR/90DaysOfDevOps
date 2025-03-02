# 🐳 Optimizing Docker Image with Multi-Stage Builds  

## 🚀 Task 4: Implementing Multi-Stage Docker Build  

### 🎯 Objective  
- Modify an existing **Dockerfile** to use **multi-stage builds**.  
- Produce a **lightweight, minimal (or distroless)** final image.  
- Compare image sizes before and after optimization.  
- Document the benefits and impact on image size.  

---

## 🔥 Why Multi-Stage Builds?  
Multi-stage builds help create **smaller, optimized images** by:  
✅ Reducing unnecessary dependencies in the final image.  
✅ Minimizing security risks by removing build tools.  
✅ Improving performance and deployment efficiency.  

---

## 📌 Step 1: Original Dockerfile (Without Multi-Stage)  
This version includes build tools in the final image, making it **larger**:  

```dockerfile
## Install the required NODE version 18 base image
FROM node:18-alpine


## Setting up the Working DIR
WORKDIR /sam

#Copying package and package-lock.json files
COPY  package*.json .

#COPY entire source codes to working dir
COPY . .

# Installing dependencies from packages.json
RUN npm install && npm run build

##server.js is cofigured to use port 3000, hence exposing port 3000
EXPOSE 3000

## Run the application using npm and start
CMD ["npm","run","dev"]
```

## Size Before Optimization:
``` bash
docker buildx build -f Dockerfile_singlestage -t online-shop:single .
ubuntu@MYLINUXEC2:/opt/docker/online_shop_Explore-TEst$ docker images | grep single
online-shop    single    7a39cd8eebac   4 minutes ago   267MB
weather-img    single    f7e34d6a2227   8 minutes ago   138MB
```

## Size After Optimization:

```bash
docker buildx build -t oneline-shop:multi .

ubuntu@MYLINUXEC2:/opt/docker/online_shop_Explore-TEst$ docker images | grep mul
oneline-shop   multi     212b5d21e8c1   8 minutes ago    220MB
```

## Docker images

```bash
ubuntu@MYLINUXEC2:/opt/docker/online_shop_Explore-TEst$ docker images
REPOSITORY     TAG       IMAGE ID       CREATED          SIZE
online-shop    single    7a39cd8eebac   8 minutes ago    267MB
oneline-shop   multi     212b5d21e8c1   10 minutes ago   220MB
weather-img    single    f7e34d6a2227   12 minutes ago   138MB
weather-img    latest    72a1aed362b8   13 minutes ago   169MB

```

### ✅ Benefits of Multi-Stage Builds  

- **🔹 Reduced Image Size**: Removing unnecessary dependencies shrinks the image significantly.  
- **🔹 Improved Security**: The final image has only runtime dependencies, reducing attack surfaces.  
- **🔹 Faster Deployment**: Smaller images result in quicker downloads & deployments.  
