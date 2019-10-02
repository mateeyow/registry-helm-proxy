FROM alpine:3.10

RUN apk add --no-cache \
  wget

RUN wget -q https://get.helm.sh/helm-v2.14.3-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm \
  && chmod +x /usr/local/bin/helm

RUN mkdir -p /root/.helm/repository/local

ENTRYPOINT ["/usr/local/bin/helm"]

EXPOSE 8879

CMD ["serve", "--address", "0.0.0.0:8879"]
