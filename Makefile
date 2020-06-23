CONTRACTS_PATH=./contracts
RELAYER_CONTRACTS_PATH=$$(realpath ./scripts/contracts)

build-relayer-contracts:
	rm -rf $(RELAYER_CONTRACTS_PATH); \
	yarn run solcjs -o $(RELAYER_CONTRACTS_PATH) --bin --abi $$(find $(CONTRACTS_PATH) -name *.sol); \
	for fileName in $$(ls $(RELAYER_CONTRACTS_PATH)); do \
		newName=$${fileName##*_}; \
		mv $(RELAYER_CONTRACTS_PATH)/$${fileName} $(RELAYER_CONTRACTS_PATH)/$${newName}; \
	done;
