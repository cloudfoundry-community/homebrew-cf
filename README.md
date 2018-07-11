A homebrew tap for useful BOSH / Cloud Foundry utilities

To enable:

```
$ brew tap starkandwayne/cf
```

Current brews offered:

- Stark & Wayne tools:
  - [genesis](https://github.com/starkandwayne/genesis)
  - [gotcha](https://github.com/starkandwayne/gotcha)
  - [safe](https://github.com/starkandwayne/safe)
  - [shield](https://github.com/starkandwayne/shield)
- Other's tools:
  - [spruce](https://github.com/geofffranks/spruce)
  - [yaml2json](https://github.com/bronze1man/go-yaml2json)
  - [uaa-cli](https://github.com/cloudfoundry-incubator/uaa-cli)
  - [govc](https://github.com/vmware/govmomi)

```plain
$ brew install spruce
$ brew install gotcha
```

Coming soon:
- [cloudfoundry-utils](https://github.com/starkandwayne/cloudfoundry-utils)

## Debian packages

This project automatically packages several CLI binaries as Debian packages. To install:

```
wget -q -O - https://raw.githubusercontent.com/starkandwayne/homebrew-cf/master/public.key | apt-key add -
echo "deb http://apt.starkandwayne.com stable main" | tee /etc/apt/sources.list.d/starkandwayne.list
apt-get update

apt-get install spruce
apt-get install safe
apt-get install bosh-cli
apt-get install bosh-bootloader
apt-get install genesis # also installs spruce, safe, vault, bosh-cli, git, perl

apt-get install gotcha
apt-get install shield
apt-get install eden
apt-get install kafka-service-broker
apt-get install install-debs-in-order

apt-get install certstrap
apt-get install credhub-cli
apt-get install cf-cli
apt-get install uaa-cli
apt-get install jq
apt-get install sipcalc
apt-get install hub
apt-get install direnv

apt-get install terraform
apt-get install vault

apt-get install concourse-fly
apt-get install concourse # also installs concourse-fly

apt-get install om
apt-get install pivnet-cli
apt-get install pks

apt-get install govc
```

NOTE: The `vault` package was manually created by https://gist.github.com/drnic/c03bf5929c7da3421e3978058845512b. The CI pipeline needs a way to detect and fetch latest Vault CLI downloads.

To update the static site's index.html, run:

```
aws s3 sync apt/ s3://apt.starkandwayne.com/
```
