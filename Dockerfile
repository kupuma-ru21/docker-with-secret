# export MY_SECRET="super_secret_value"
FROM alpine
RUN --mount=type=secret,id=my_secret,uid=1000 \
    MY_SECRET=$(cat /run/secrets/my_secret) && \
    echo "=== MY_SECRET VALUE: $MY_SECRET ==="
