#!/bin/bash

set -e

source $1

cardano-cli transaction build \
    --babbage-era \
    --testnet-magic 1 \
    --tx-in $tx_in_fees \
    --tx-in $tx_in_ppbl2024 \
    --tx-in-collateral $tx_in_fees \
    --tx-in $contributor_reference_validator_tx_in \
    --spending-tx-in-reference $ref_utxo \
    --spending-plutus-script-v2 \
    --spending-reference-tx-in-inline-datum-present \
    --spending-reference-tx-in-redeemer-file $redeemer \
    --tx-out $sender+"2000000 + 1 $ppbl_2024_policyid.$ppbl_token_222_name" \
    --tx-out $contrib_ref_validator_addr+"$lovelace_in_ref_utxo + 1 $ppbl_2024_policyid.$ppbl_token_100_name" \
    --tx-out-inline-datum-file $datum \
    --change-address $sender \
    --out-file $2