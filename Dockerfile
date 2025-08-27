FROM alpine:latest

RUN apk update
RUN apk add --no-cache wget 
RUN cd /opt && wget https://storage.googleapis.com/rsj-episodes/mini
RUN if [ -v SERVE_DIR ]; then echo "serving direcotry $SERVE_DIR"; else export SERVE_DIR='/mnt/media'; echo "serving direcotry /mnt/media"; fi
RUN /opt/mini --port $PORT $SERVE_DIR
