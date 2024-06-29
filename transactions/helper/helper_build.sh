#!/bin/bash

set -e

source $1

cardano-cli transaction build \
--babbage-era \
--testnet-magic 1 \
--tx-in $tx_in \
--tx-out $receiver+$lovelace_amount \
--change-address $sender \
--out-file $2