#!/bin/sh

if [ -n "${DISCORD_WH+x}" ]; then
  DISCORD="--discord ${DISCORD_WH}"
fi

if [ -n "${CURRENCY_VALUE+x}" ]; then
  CURRENCY="--currency ${CURRENCY_VALUE}"
fi

python3 ms_rewards_farmer.py --dont-check-for-updates --skip-unusual --fast --no-images --no-webdriver-manager --on-finish exit $DISCORD $CURRENCY
