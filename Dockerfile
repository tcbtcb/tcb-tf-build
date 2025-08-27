FROM alpine:latest

RUN apk update
RUN apk add --no-cache wget 
RUN mkdir /app
RUN cd /app && wget https://storage.googleapis.com/rsj-episodes/mini
RUN if [ -v PORT ]; then echo "serving port $PORT"; else export PORT='9090'; echo "serving port 9090"; fi
RUN if [ -v SERVE_DIR ]; then echo "serving direcotry $SERVE_DIR"; else export SERVE_DIR='/mnt/media'; echo "serving direcotry /mnt/media"; fi
RUN chmod 744 /app/mini
RUN chmod +x /app/mini
ENTRYPOINT ls /app && /app/mini --port $PORT $SERVE_DIR
