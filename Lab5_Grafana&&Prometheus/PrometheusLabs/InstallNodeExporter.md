# Installing Node Exporter for Prometheus Monitoring

This guide provides step-by-step instructions on how to install and configure Node Exporter to collect hardware and OS metrics from your server and expose them to Prometheus.

## Prerequisites

- A Linux-based system (e.g., Ubuntu, CentOS)
- Prometheus installed and configured
- Basic understanding of Linux commands and Prometheus

## Step 1: Download Node Exporter

1. Visit the [Node Exporter GitHub Releases](https://github.com/prometheus/node_exporter/releases) page to find the latest release.
2. Download the latest Node Exporter binary using `wget`:

   ```bash
   wget https://github.com/prometheus/node_exporter/releases/download/v1.6.1/node_exporter-1.6.1.linux-amd64.tar.gz



## Step 2: Extract the Archive

1. Use this command to extract this archive:

   ```bash
   tar xvfz node-exporter-*.linux-amd64.tar.gz

2. This will created a directory named `node-exporter-1.6.1.linux-amd64.tar.gz`



## Step 3: Create a Systemd Service File

1. Create a Systemd service file

    ```bash
    sudo vi /etc/systemd/sytem/node_exporter.service

2. Add the following content  to the file

    [Unit]
    Description=Node Exporter
    Wants=network-online.target
    After=network-online.target

    [Service]
    User=root
    ExecStart=/usr/local/bin/node_exporter --web.listen-address = <Your Machine Ip Address>:<Your Port Service run>

    [Install]
    WantedBy=default.target


## Step 4: Start and Enable the Node Exporter Service

1. Start the Node Exporter Service

    ```bash
    sudo systemctl start node_exporter

2. Enable the Service to start on boot

    ```bash
    sudo systemctl enable node_exporter

3. Check status of service

    ```bash
    sudo systemctl status node_exporter


    
---
This README.md file provides a clear and structured guide for installing Node Exporter in Prometheus, covering all necessary steps.




