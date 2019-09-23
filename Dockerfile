FROM alpine:3.7

RUN apk --update add python3 bind-tools && \
    apk add dos2unix --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted

RUN pip3 install scapy

RUN mkdir /dnsspoof
WORKDIR /dnsspoof

COPY hosts exploit.py ./
RUN dos2unix exploit.py && chmod +x exploit.py

CMD ["python3", "exploit.py"]
