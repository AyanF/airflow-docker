# airflow-docker
Contains docker file to setup airflow 

1. Clone the repo 

https://github.com/AyanF/airflow-docker

cd into : 
cd airflow-docker

2. Build the image using 

          docker build . --tag airflow:latest

3. Run the image 

	docker run airflow:latest airflow standalone
 
4. Access Airflow at - http://http://172.17.0.2/:8080/home

5. Login using 

	User - admin
	Password - admin
