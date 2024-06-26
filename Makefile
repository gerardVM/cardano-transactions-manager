ENV_FILE         = ./transactions/${TX}/${TX}_vars.env
BUILD_FILE       = ./transactions/${TX}/${TX}_build.sh

WALLET_NAME      = ""
SENDER_KEY       = ./wallets/${WALLET_NAME}/payment.skey
ADDRESS          = $(shell cat ./wallets/${WALLET_NAME}/payment.addr)

TX               = ""
OUTPUTS_DIR      = ./transactions/${TX}/outputs
TRANSACTION_FILE = ${OUTPUTS_DIR}/simple_tx.draft
SIGNED_FILE      = ${OUTPUTS_DIR}/simple_tx.signed


-include Makefile.local


extract:
	@./scripts/extract_variables.sh ${BUILD_FILE} ${ENV_FILE}


query-tip:
	@cardano-cli query tip --testnet-magic 1

address:
	@./scripts/new_address.sh ${WALLET_NAME}

query:
	@cardano-cli query utxo --testnet-magic 1 --address ${ADDRESS}


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
