FROM python:3.10.3

WORKDIR /

COPY . .

RUN make install

EXPOSE 8080

RUN "python train.py"
