FROM python

RUN apk update && \
    apk add --virtual build-deps gcc python-dev musl-dev 
RUN apk add nginx

RUN apk update && \
    apk add --virtual build-deps gcc python-dev musl-dev


WORKDIR /app

COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt --src /usr/local/src

COPY . .

EXPOSE 5000
CMD [ "python", "main.py" ]
