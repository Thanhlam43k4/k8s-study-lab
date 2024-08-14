# Prometheus

![Prometheus Logo](https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Prometheus_software_logo.svg/1200px-Prometheus_software_logo.svg.png)

Prometheus is an open-source systems monitoring and alerting toolkit originally built at SoundCloud. Since its inception in 2012, many companies and organizations have adopted Prometheus, and the project has a very active developer and user community. It is now a standalone open-source project, maintained independently of any company.

To emphasize this, and to clarify the project's governance structure, Prometheus joined the [**CNCF (Cloud Native Computing Foundation)**](https://www.cncf.io/) in 2016 as the second hosted project after [**Kubernetes**](https://kubernetes.io/).

Prometheus collects and stores its metrics as time series data. Metrics information is stored with the timestamp at which it was recorded, alongside optional key-value pairs called **labels**.

## 🚀 Features

- **Multi-dimensional data model:** Time series data is identified by a metric name and key/value pairs.
- **PromQL:** A flexible query language to leverage this dimensionality.
- **No reliance on distributed storage:** Single server nodes are autonomous.
- **Time series collection:** Happens via a pull model over HTTP.
- **Graphing and dashboarding support:** Multiple modes available.

## 📊 What are Metrics?

Metrics are numerical measurements in layperson terms. The term "time series" refers to the recording of changes over time. What users want to measure differs from application to application:

- For a **web server**, it could be request times.
- For a **database**, it could be the number of active connections or active queries.
- And so on...

Metrics play an important role in understanding why your application is behaving in a certain way. For instance, if you're running a web application and discover that it is slow, metrics can help you determine why. For example, when the number of requests is high, the application may become slow. If you have the request count metric, you can determine the cause and increase the number of servers to handle the load.

## ⚙️ How Prometheus Works

Prometheus operates based on a **pull model** where it actively scrapes metrics from monitored services at defined intervals. Here's a detailed explanation of how Prometheus works:

### 1. Data Collection (Scraping)

- **Pull-Based Model:** Prometheus collects data by scraping HTTP endpoints exposed by applications and services. This means that Prometheus regularly makes HTTP requests to these endpoints to fetch the latest data.

- **Scrape Targets:** The endpoints that Prometheus scrapes are known as scrape targets. These targets must expose metrics in a format that Prometheus can understand, typically in plain-text form at a `/metrics` endpoint.

- **Service Discovery:** To automate the discovery of scrape targets, Prometheus supports various service discovery mechanisms. These can include static configurations as well as dynamic integrations with **Kubernetes**, **Consul**, **AWS EC2**, and more, allowing Prometheus to adapt to changes in a dynamic environment.

> **Note:** Service discovery is a mechanism that allows services in a distributed system to find and communicate with each other without needing to know each other’s exact addresses beforehand. It’s an essential component in microservices architecture, where services are often deployed on multiple servers and their IP addresses or domain names can change.

### 2. Prometheus Query Language (PromQL)

- **Quering Data**: Prometheus uses its own query language, PromQL, to allow users to query and manipulate the collected metrics. PromQL is powerful and supports various operations, including:
    - Filtering: Select specific metrics based on labels.
    - Aggregation: Aggregate data across different dimensions (Eg., sum, average).
    - Rate Calculations: Calculate the rate of change over time, which is crucial for monitoring metrics like CPU Usage or request rates.

    - Histogram Analysis: Perform operations on histograms and summary metrics.
- Example. A PromQL query might look like this:
    - `rate(http_requests_total[5m])` - This query calculates the per-second rate of HTTP requests over the last 5 minutes.

### 3. Exporters
- **Third-Party Integration**: Prometheus uses exporters to gather metrics from third-party service, systems, and applications. Exporter act as intermediaries, exposing metrics in a format that Prometheus can scrape.    
-   **Common Exporters**:
    -   Node Exporter: Collects hardware and OS-level metrics from Linux System.
    -   BlackBox Exporter: Monitors network endpoint by performing HTTP requests, pings, and DNS lookups.
    -   MYSQL Exporter: Exposes MySQL server metrics.
    -   JWT Exporter: Collects metrics from Java application using JMX.
  


### 4. Prometheus Architecture

<img alt = "Prometheus Image" align = "center" src = "https://blogger.googleusercontent.com/img/a/AVvXsEgwArAOVS97bSEigr455fuk6Qo9aY_c5grLdRq4sKYhXBhlBy_M56yaHnPT8nhe2OdW76wbvCsN3bWUcN8ZwVwGyd6NBQT5I8HrCWtZYBLp7Dq4JuNBHdzu-I6NNboZZXoxoW6I5MOecYurC_WcCncNy-8tppSC1sSl-NKcjBGayXLwWfpN7Rahh2ukdb6A" width = "600">
## 📚 Resources

- [Prometheus Documentation](https://prometheus.io/docs/introduction/overview/)
- [CNCF Website](https://www.cncf.io/)
- [Kubernetes Official Website](https://kubernetes.io/)

## 📸 Screenshots

![Prometheus Dashboard Example](https://prometheus.io/assets/screenshots/20220602/graph-page.png)

## 🛠️ Contributing

If you want to contribute to Prometheus, please refer to the [contributing guide](https://github.com/prometheus/prometheus/blob/main/CONTRIBUTING.md).

## 📄 License

Prometheus is licensed under the [Apache 2.0 License](https://github.com/prometheus/prometheus/blob/main/LICENSE).

---

Made with ❤️ by Thanhlam