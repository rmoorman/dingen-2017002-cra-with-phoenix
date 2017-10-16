PM=honcho


.PHONY: default
default:
	@echo There are only specific targets to execute

.PHONY: client
prod-client:
	PUBLIC_URL=. mix dingen.build_client

.PHONY: dev-setup
dev-setup:
	mix deps.get
	cd client; npm install

.PHONY: dev-server
dev-server:
	$(PM) start -f Procfile.development
