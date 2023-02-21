# microsoft-rewards-bot

[farshadz1997/Microsoft-Rewards-bot](https://github.com/farshadz1997/Microsoft-Rewards-bot) but dockerized.

## docker-cli
```sh
docker run --rm -it \
  --shm-size 2g \
  -v "$PWD"/accounts.json:/app/accounts.json \
  ghcr.io/haq/microsoft-rewards-bot
```
