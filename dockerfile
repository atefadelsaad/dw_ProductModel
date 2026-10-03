FROM apache/airflow:3.3.1

USER root

RUN apt-get update \
    && apt-get install -y gcc g++ unixodbc-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER airflow

RUN pip install --no-cache-dir apache-airflow-providers-microsoft-mssql pymssql