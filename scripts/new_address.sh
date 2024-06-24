wallet_name=$1

cardano-cli address key-gen \
--verification-key-file ./wallets/$wallet_name/payment.vkey \
--signing-key-file ./wallets/$wallent_name/payment.skey

cardano-cli stake-address key-gen \
--verification-key-file ./wallets/$wallet_name/stake.vkey \
--signing-key-file ./wallets/$wallet_name/stake.skey

cardano-cli address build \
--payment-verification-key-file ./wallets/$wallet_name/payment.vkey \
--stake-verification-key-file ./wallets/$wallet_name/stake.vkey \
--testnet-magic 1 \
--out-file ./wallets/$wallet_name/payment.addr