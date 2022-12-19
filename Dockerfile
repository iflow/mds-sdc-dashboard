# https://fastapi.tiangolo.com/deployment/docker/
FROM python:3.9

# working directoring in the container
WORKDIR /code

# copy the requirements file into the workdir
COPY ./requirements.txt /code/requirements.txt

# install the required packages
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# copy the python code
COPY api/ /code/api

COPY app/ /code/app

EXPOSE 8866

# run a command, after the container starts
# voila (or the Tornado web server behind) should listen on all ip addresses with --voila.ip 0.0.0.0
# whitelist all static voila files (so the voila javascript files will be accessible)
CMD ["voila", "--Voila.ip", "0.0.0.0", "--VoilaConfiguration.file_whitelist", "['.*']", "app/main.ipynb"]