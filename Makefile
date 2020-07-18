
generate-pass:
	source .env && yarn run clear:reports && yarn run cy:run:pass || make send-slack

generate-fail:
	source .env && yarn run clear:reports && yarn run cy:run:fail || make send-slack

generate-pass-script:
	SPECS='cypress/integration/pass/*' ts-node script.ts
	
generate-fail-script:
	SPECS='cypress/integration/fail/*' ts-node script.ts

test-multi-reporters:
	./node_modules/.bin/cypress run --reporter-options configFile=reporterOpts.json --project ./cypress/integration