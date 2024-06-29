#!/bin/bash

set -e

source $1

cardano-cli transaction build \
    --babbage-era \
    --testnet-magic 1 \
    --tx-in $tx_in_fees \
    --tx-in $tx_in_tokens \
    --tx-out $faucet_validator_addr+"2000000 + $quantity $unit" \
    --tx-out-inline-datum-file $datum \
    --change-address $sender \
    --out-file $2