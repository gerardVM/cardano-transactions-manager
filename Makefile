ENV_FILE         = ./transactions/${PROJECT}/${PROJECT}_vars.env
BUILD_FILE       = ./transactions/${PROJECT}/${PROJECT}_build.sh

WALLET_NAME      = ""
SENDER_KEY       = ./wallets/${WALLET_NAME}/payment.skey
SENDER_ADDR      = ./wallets/${WALLET_NAME}/payment.addr

PROJECT          = ""
OUTPUTS_DIR      = ./transactions/${PROJECT}/outputs
TRANSACTION_FILE = ${OUTPUTS_DIR}/simple_tx.draft
SIGNED_FILE	     = ${OUTPUTS_DIR}/simple_tx.signed


-include Makefile.local


extract-variables:
	./scripts/extract_variables.sh ${BUILD_FILE} ${ENV_FILE}


query-tip:
	cardano-cli query tip --testnet-magic 1


address:
	./scripts/new_address.sh ${WALLET_NAME}

query:
	./scripts/query_utxo.sh ${SENDER_ADDR}


build:
	@mkdir -p ${OUTPUTS_DIR}
	@${BUILD_FILE} ${ENV_FILE} ${TRANSACTION_FILE}
	@echo Transaction built!

sign:
	@cardano-cli transaction sign \
	--signing-key-file ${SENDER_KEY} \
	--testnet-magic 1 \
	--tx-body-file ${TRANSACTION_FILE} \
	--out-file ${SIGNED_FILE}
	@echo Signed!

submit:
	@cardano-cli transaction submit \
	--tx-file ${SIGNED_FILE} \
	--testnet-magic 1
	@echo Submitted!
