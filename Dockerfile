FROM python:3-slim-bookworm

WORKDIR /mnt/media 
ENTRYPOINT python3 server.py
