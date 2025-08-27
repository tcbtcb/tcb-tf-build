FROM debian:latest

RUN apt update
RUN apt install -y --no-cache wget 
RUN mkdir /app
WORKDIR /app
RUN wget https://storage.googleapis.com/rsj-episodes/mini
RUN if [ -v PORT ]; then echo "serving port $PORT"; else export PORT='9090'; echo "serving port 9090"; fi
RUN if [ -v SERVE_DIR ]; then echo "serving direcotry $SERVE_DIR"; else export SERVE_DIR='/mnt/media'; echo "serving direcotry /mnt/media"; fi
RUN chmod 755 /app/mini
RUN chmod +x /app/mini
run export PATH=$PATH:/app
ENTRYPOINT /app/mini --port $PORT $SERVE_DIR
