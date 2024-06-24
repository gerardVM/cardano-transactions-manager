
WALLET_NAME      = ""
SENDER_KEY       = ./wallets/${WALLET_NAME}/payment.skey
SENDER_ADDR      = ./wallets/${WALLET_NAME}/payment.addr

PROJECT          = ""
TRANSACTION_FILE = ./transactions/${PROJECT}/outputs/simple-tx.draft
SIGNED_FILE	     = ./transactions/${PROJECT}/outputs/simple-tx.signed


-include Makefile.local


extract-variables:
	./scripts/extract_variables.sh ./transactions/${PROJECT}/build-transaction.sh ./transactions/${PROJECT}/variables.env


query-tip:
	cardano-cli query tip --testnet-magic 1


new-address:
	./scripts/new_address.sh ${WALLET_NAME}

query-utxo:
	./scripts/quey_utxo.sh ${SENDER_ADDR}


transaction-build:
	./transactions/${PROJECT}/build-transaction.sh ${TRANSACTION_FILE}

transaction-sign:
	cardano-cli transaction sign \
	--signing-key-file ${SENDER_KEY} \
	--testnet-magic 1 \
	--tx-body-file ${TRANSACTION_FILE} \
	--out-file ${SIGNED_FILE}

transaction-submit:
	cardano-cli transaction submit \
	--tx-file ${SIGNED_FILE} \
	--testnet-magic 1
