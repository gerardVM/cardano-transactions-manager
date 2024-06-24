wallet=$1

cardano-cli query utxo --testnet-magic 1 --address $(cat $wallet)