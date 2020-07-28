install: # Setup
	make bundle-install
	make mint-download
	make mint-install
	make gen

mint-download: # Download Mint
	brew install mint

mint-install: # Install Mint dependencies
	mint bootstrap

bundle-install: # Install bundle dependencies
	bundle install --path vendor/bundle

gen: # Generate project with XcodeGen
	rm -r -f *.xcodeproj
	mint run xcodegen

open: # Open Xcode
	open *.xcodeproj

help: # Help
	@grep -E '^[a-zA-Z_-]+:.*?# .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":[^#]*? #| #"}; {printf "%-42s%s\n", $$1 $$3, $$2}'
