#Base Image
FROM python:3.8-alpine
#MAINTAINER Rafal Fusik <rafalfusik@gmail.com>

USER root

#Install Python pip
RUN apk add --update py3-pip&& \
#apt-get update --no-cache python3 && \
        echo ' ***** Set up python and pip ***** ' && \ 
        apk add --virtual build-deps gcc python3-dev musl-dev && \
        #apt-get install -y python python-dev python-distribute python-pip && \
        ln -sf python3 /usr/bin/python && \
        python3 -m ensurepip && \
        pip3 install --no-cache --upgrade pip setuptools && \
        pip3 install --upgrade pip && \
        echo ' ***** Other libs ... ***** ' && \
        apk --update --upgrade add \
        #apt-get install \
        gcc \
        jpeg-dev \
        zlib-dev \
        libpq \
        libffi-dev \
        cairo-dev \
        pango-dev \
        gdk-pixbuf-dev \
        postgresql-dev \
	libgcc \
	curl

#Copy files and move into work directory
COPY . /usr/src/blog_api
WORKDIR /usr/src/blog_api

# add and install requirements
RUN \
        echo ' ***** Install dependencies ***** ' && \
        pip3 install -r pip_requirements.txt

RUN \
        echo ' ***** pipenv setup ***** ' && \
        pipenv install --system --deploy --skip-lock

#Set ENV variables
ENV FLASK_ENV=development
ENV DATABASE_URL=postgres://postgresadmin:password@10.1.239.7:5432/postgresdb
ENV JWT_SECRET_KEY=hhgaghhgsdhdhdd

RUN \
        echo ' ***** table creation ***** ' && \
        chmod +x tables_creation.sh && \
        ./tables_creation.sh

#Expose port
EXPOSE 5000

#Run the flask backend
CMD ["python", "run.py"]
