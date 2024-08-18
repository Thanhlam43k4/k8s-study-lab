# Setting Up Prometheus

This guide provides instructions on how to install and configure Prometheus for monitoring.

## Prerequisites

- A Linux-based system (e.g., Ubuntu, CentOS)
- Basic understanding of Linux commands

## Step 1: Download Prometheus

1. Visit the [Prometheus download page](https://prometheus.io/download/) to find the latest stable release.
2. Download the Prometheus tarball using `wget`:

   ```bash
   wget https://github.com/prometheus/prometheus/releases/download/v2.47.0/prometheus-2.47.0.linux-amd64.tar.gz



## Step 2: Extract the Archive

1. Use this command to extract this archive:

   ```bash
   tar xvfz prometheus-*.linux-amd64.tar.gz


2. This will create a directory named `prometheus-2.47.0.linux-amd64`.



## Step 3: Create a Systemd Service File

1. Create a Systemd service file

    ```bash
    sudo vi /etc/systemd/system/prometheus.service


2. Add the following content  to the file

    [Unit]
    Description=Prometheus
    Wants=network-online.target
    After=network-online.target

    [Service]
    User=root
    ExecStart=/home/thanhlam/Prometheus/prometheus-2.47.0.linux-amd64/prometheus \
    --config.file=/home/thanhlam/Prometheus/prometheus-2.47.0.linux-amd64/prometheus.yml


    [Install]
    WantedBy=multi-user.target


## Step 4: Start and Enable the Prometheus Service

1. Start the Prometheus Service

    ```bash
    sudo systemctl start prometheus


2. Enable the Service to start on boot

    ```bash
    sudo systemctl enable prometheus


3. Check status of service

    ```bash
    sudo systemctl status prometheus


---
This guide provides a comprehensive setup process for Prometheus, including downloading, installing, configuring, and verifying the installation.






    