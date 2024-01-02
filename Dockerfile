# Dockerfile
# Build from nvidia file for compatibility with AI/ML
FROM nvidia/cuda:11.0.3-base-ubuntu20.04

# Set the time zone
ENV TZ=America/Los_Angeles

# Install time zone data package
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install -y tzdata

# Deal with other packages
RUN apt-get update && \
    apt-get install -y wget curl netcat unzip net-tools git libgl1-mesa-glx libglib2.0-0

# Set workdir, copy run script and config file
WORKDIR /app
COPY run.sh ./
COPY config.yaml ./
RUN chmod +x run.sh

# Download and Unzip stable-d runtime
RUN wget https://github.com/cmdr2/stable-diffusion-ui/releases/latest/download/Easy-Diffusion-Linux.zip && \
    unzip Easy-Diffusion-Linux.zip && \
    chmod -R 777 /app

# Stable-d script
CMD ["/app/run.sh"]
