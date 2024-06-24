source "$(dirname "$0")/variables.env"

cardano-cli transaction build \
--babbage-era \
--testnet-magic 1 \
--tx-in $tx_in \
--tx-in $tx_in_tokens \
--tx-out $receiver+"$lovelace_amount + $asset_amount $asset_id" \
--change-address $sender \
--out-file $1
