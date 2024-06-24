source "$(dirname "$0")/variables.env"

cardano-cli transaction build \
--babbage-era \
--testnet-magic 1 \
--tx-in $tx_in \
--tx-out $receiver+$lovelace_amount \
--change-address $sender \
--out-file $transaction-file