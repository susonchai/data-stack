FROM apache/airflow:2.1.2
USER root

# install build essentials
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list

RUN apt-get update

RUN ACCEPT_EULA=Y apt-get install -y msodbcsql17
RUN ACCEPT_EULA=Y apt-get install -y mssql-tools
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
RUN source ~/.bashrc

RUN apt-get install -y unixodbc-dev
RUN apt-get install -y libgssapi-krb5-2
RUN apt-get install -y g++
RUN apt-get install -y --reinstall build-essential

RUN apt-get update \
  && apt-get install -y git libpq-dev python3 python3-pip \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
  
COPY requirements.txt .
USER airflow
RUN pip3 install -r requirements.txt
RUN pip3 install --upgrade cffi
RUN pip3 install cryptography~=3.4 dbt==0.19.0
