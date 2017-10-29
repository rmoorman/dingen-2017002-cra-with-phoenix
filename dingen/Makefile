PM=honcho


.PHONY: default
default:
	@echo There are only specific targets to execute

.PHONY: prod-client
prod-client:
	PUBLIC_URL=. mix dingen.build_client

.PHONY: dev-setup
dev-setup:
	mix deps.get
	cd client/frontend; npm install
	cd client/admin; npm install

.PHONY: dev-server
dev-server:
	$(PM) start -f Procfile.development; true
