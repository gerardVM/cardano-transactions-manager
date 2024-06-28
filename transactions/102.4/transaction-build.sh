#!/bin/bash

set -e

source $1

cardano-cli transaction build \
    --babbage-era \
    --testnet-magic 1 \
    --tx-in $tx_in_fees \
    --tx-in-collateral $tx_in_fees \
    --tx-in $faucet_validator_tx_in \
    --spending-tx-in-reference $ref_utxo \
    --spending-plutus-script-v2 \
    --spending-reference-tx-in-inline-datum-present \
    --spending-reference-tx-in-redeemer-file $redeemer_file \
    --tx-out $sender+"2000000 + 1000000 $faucet_token_unit" \
    --tx-out $sender+"2000000 + 1 $ppbl_token_unit" \
    --tx-out $faucet_addr+"2000000 + $number_tokens_output $faucet_token_unit" \
    --tx-out-inline-datum-file $datum_file \
    --change-address $sender \
    --out-file $2

    
#    --tx-in $tx_in_ppbl2024 \