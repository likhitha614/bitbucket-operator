NAMESPACE  ?= default
REPOSITORY ?= quay.io/steigr/bitbucket-operator
PREFIX     ?= bitbucket

all: release
	@true

release:
	./generate-and-install-operator.sh "$(NAMESPACE)" "$(REPOSITORY)" "$(shell git describe --tags)" "$(PREFIX)"

logo.png:
	curl -L -o logo.png https://confluence.atlassian.com/bitbucket/files/877358733/946613493/1/1520466804422/BitbucketLogo180x200.png

logo: logo.png
	convert logo.png -resize 40x40 - | base64 -b0 > logo
