[![create and publish docker image](https://github.com/haq/microsoft-rewards-bot/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/haq/microsoft-rewards-bot/actions/workflows/docker-publish.yml)

# microsoft-rewards-bot

[farshadz1997/Microsoft-Rewards-bot](https://gitlab.com/farshadzargary1997/Microsoft-Rewards-bot.git) but dockerized.

## docker-cli

```sh
docker run --rm -it \
  --shm-size 4g \
  -v "$PWD"/accounts.json:/app/accounts.json \
  ghcr.io/haq/microsoft-rewards-bot
```

## recommended usage

### compose.yml

```yml
services:

  rewards-home:
    image: ghcr.io/haq/microsoft-rewards-bot
    container_name: rewards_home
    shm_size: 4gb
    volumes:
     - ./accounts.json:/app/accounts.json
    restart: no

  rewards-vpn:
    image: ghcr.io/haq/microsoft-rewards-bot
    container_name: rewards_vpn
    network_mode: service:wireguard
    shm_size: 4gb
    depends_on:
      - wireguard
    volumes:
     - ./accounts.json:/app/accounts.json
    restart: no

  wireguard:
    image: lscr.io/linuxserver/wireguard
    container_name: wireguard
    cap_add:
      - NET_ADMIN
      - SYS_MODULE
    sysctls:
      - net.ipv4.conf.all.src_valid_mark=1
      - net.ipv4.ip_forward=1
      - net.ipv6.conf.all.disable_ipv6=1
    volumes:
      - ./wg0.conf:/config/wg0.conf
    restart: unless-stopped
```

### accounts.json

```json
[
  {
    "username": "account-1@mail.com",
    "password": "password-1"
  },
  {
    "username": "account-2@mail.com",
    "password": "password-2"
  },
  {
    "username": "account-3@mail.com",
    "password": "password-3"
  }
]
```

### wg0.conf

```conf
[Interface]
PrivateKey =
Address =
DNS =

[Peer]
PublicKey =
PresharedKey =
AllowedIPs = 0.0.0.0/0
PersistentKeepalive = 25
Endpoint =
```

### crontab

- It is recommended that you randomize the time each script is run.
- Also take note of how long the script takes to run. There should be no overlap.

```crontab
0 4 * * * docker start rewards_home
0 5 * * * docker start rewards_vpn
```
