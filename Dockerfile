FROM python:3.6-slim

WORKDIR /app
COPY . .
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

RUN  useradd  -d /home/osdr osdr && \
     mkdir -p /home/osdr/.osdr && \
     chmod +x osdr.py && \
     mkdir /sandbox && \ 
     chown osdr /sandbox && \ 
     chown osdr -R /home/osdr
USER osdr
VOLUME /sandbox
VOLUME /home/osdr

WORKDIR /sandbox
ENTRYPOINT ["python", "/app/osdr.py"]
CMD ["-h"]

