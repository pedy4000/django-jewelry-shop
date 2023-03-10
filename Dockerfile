# pull the official base image
FROM python:3.9-alpine AS node

# expose port
EXPOSE 8000

# set work directory
WORKDIR /

# install dependencies
COPY requirements.txt /
RUN pip3 install -r requirements.txt --no-cache-dir

# copy project
COPY . / 

# run server
ENTRYPOINT ["python3"] 
CMD ["manage.py", "runserver", "0.0.0.0:8000"]

ARG BRANCH
ARG COMMIT
LABEL ir.myket.branch=$BRANCH
LABEL ir.myket.commit=$COMMIT
