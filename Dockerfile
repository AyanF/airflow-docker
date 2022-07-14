FROM apache/airflow:2.3.2

#Check the user id of current user(to be assigned to variable NONROOT)
RUN echo $UID --no-cache

#Uprade pip 
RUN pip install --user --upgrade pip

#Install astronomer-providers package
RUN pip install --no-cache-dir --user astronomer-providers==1.5.0 

#set user id of non root user 
ARG NONROOT=50000

#set user to root 
USER root

#install Git 
RUN apt-get update \
    	&& apt-get install -y git

#install text editor sed
RUN apt-get install -y sed

#install text editor vim
RUN apt-get install -y vim

#go to base dir
WORKDIR /

#go to airlfow plugins folder
WORKDIR opt/airflow/plugins

#clone plugins from repo
RUN git clone https://github.com/AyanF/Airflow-plugins .

#back to base dir
WORKDIR /

#go to airflow dags
WORKDIR opt/airflow/dags

#clone dags from repo
RUN git clone https://github.com/AyanF/Airflow-dags.git .

#backto base dir
WORKDIR /

#swirch back to non root user 
USER $NONROOT

#initialize airflow database
RUN airflow db init  

#create a admin user
RUN airflow users create --role Admin --username admin --email admin --firstname admin --lastname admin --password admin


#go to airflow dir
WORKDIR opt/airflow

RUN echo $UID

#Edit airflow.cfg file

RUN sed -i 's/airflow.api.auth.backend.session/airflow.api.auth.backend.basic_auth/g' airflow.cfg















