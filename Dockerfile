# pull the official base image
FROM --platform=$BUILDPLATFORM python:3.7-alpine AS builder

# expose port
EXPOSE 8000

# set work directory
WORKDIR /

# install dependencies
COPY requirements.txt /app
RUN pip3 install -r requirements.txt --no-cache-dir

# copy project
COPY . / 

# run server
ENTRYPOINT ["python3"] 
CMD ["manage.py", "runserver", "0.0.0.0:8000"]
