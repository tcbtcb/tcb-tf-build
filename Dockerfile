FROM alpine:latest

RUN apk update
RUN apk add --no-cache wget 
RUN cd /opt && wget https://storage.googleapis.com/rsj-episodes/mini
RUN if [ -v PORT ]; \
then \
echo "using port $PORT" \
else \
export PORT='9090' && echo "using port 9090" \
fi
RUN if [ -v SERVER_DIR ]; then echo "serving direcotry $SERVE_DIR" else export SERVE_DIR='/mnt/media' && echo "serving direcotry /mnt/media" fi
RUN /opt/mini --port $PORT $SERVE_DIR
