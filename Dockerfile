FROM golang:1.15-buster

RUN apt-get update && apt-get install -y ca-certificates git

# install a version of tf
RUN cd /root && git clone https://github.com/hashicorp/terraform.git 
RUN cd /root/terraform && git checkout tags/v0.13.0 && go install

# retrieve/install terraform-sops provider
RUN go get github.com/carlpett/terraform-provider-sops && \
  mkdir -p /root/.terraform.d/plugins/ && \
  cp /go/bin/terraform-provider-sops /root/.terraform.d/plugins/


WORKDIR /whelp
