# Stark & Wayne's Homebrew Tap & APT Repository

Homebrew Tap & Debian Packages for useful BOSH / Cloud Foundry / Kubernetes
utilities. Some are software we've written, others are community tools we've
found valuable in day-to-day operations with CF and Kubernetes.

## Homebrew Tap

Tap the formula repository:
```plain
brew tap starkandwayne/cf
```


Current software offered:

| Package | Description | Author | Source |
| ------- | ----------- | ------ | ------ |
eden      | CLI tool to interact with any Open Service Broker API | Stark & Wayne | [starkandwayne/eden](https://github.com/starkandwayne/eden)
genesis   | BOSH Deployment Paradigm | Stark & Wayne | [starkandwayne/genesis](https://github.com/starkandwayne/genesis)
gotcha    | Small HTTP/HTTPS MITM proxy, to troubleshoot encrypted HTTP traffic | Stark & Wayne | [starkandwayne/gotcha](https://github.com/starkandwayne/gotcha)
govc      | vSphere CLI built on top of govmomi | VMWare | [vmware/govmomi](https://github.com/vmware/govmomi)
kafka-service-broker | CLI tool to interact with Kafka/ZooKeeper OSB | Stark & Wayne | [starkandwayne/kafka-service-broker](https://github.com/starkandwayne/kafka-service-broker)
quaa      | Tool to quickly deploy/run the Cloud Foundry UAA locally, or to a remote platform/cloud | Stark & Wayne | [quaa](https://github.com/starkandwayne/quaa)
riff      | CLI tool that helps developers build and run functions using Knative | Pivotal | [projectriff/riff](https://github.com/projectriff/riff)
safe      | CLI tool to interact with a Vault server | Stark & Wayne | [starkandwayne/safe](https://github.com/starkandwayne/safe)
shield    | CLI tool to interact with SHIELD, a data protection offering | Stark & Wayne | [starkandwayne/shield](https://github.com/starkandwayne/shield)
spruce    | General purpose YAML & JSON merging tool | geoffranks et al. | [geoffranks/spruce](https://github.com/geoffranks/spruce)
uaa-cli   | Experimental CLI for UAA written in Golang | Various | [cloudfoundry-community/uaa-cli](https://github.com/cloudfoundry-community/uaa-cli)

To install a package from our tap, run:

`brew install starkandwayne/cf/<package>`, e.g. `brew install starkandwayne/cf/safe`

_Please note that while some of the above software is provided by other
formulas, we only support installations from our tap. Other taps contain
mismatched dependency versions which outright break some of our software.
Please make sure you prefix package names with `starkandwayne/cf/<package>`
to avoid installing an unsupported version._

## Debian packages

This project automatically packages several CLI binaries as Debian packages as
well. To add our APT repository to your OS:

```plain
wget -q -O - https://raw.githubusercontent.com/starkandwayne/homebrew-cf/master/public.key | apt-key add -
echo "deb http://apt.starkandwayne.com stable main" | tee /etc/apt/sources.list.d/starkandwayne.list
apt-get update
```

The above snippet will add our GPG key to your APT keychain, add the
repository, and update your cache.

The following packages are provided by the APT repository:

| Package | Description | Author | Source |
| ------- | ----------- | ------ | ------ |
bosh-cli  | CLI tool to interact with a BOSH director | Cloudfoundry | [cloudfoundry/bosh-cli](https://github.com/cloudfoundry/bosh-cli)
bosh-bootloader | CLI tool for standing up a BOSH director | Cloudfoundry | [cloudfoundry/bosh-bootloader](https://github.com/cloudfoundry/bosh-bootloader)
eden      | CLI tool to interact with any Open Service Broker API | Stark & Wayne | [starkandwayne/eden](https://github.com/starkandwayne/eden)
certstrap | Tools to bootstrap CAs, certificate requests, and signed certificates. | Square | [square/certstrap](https://github.com/square/certstrap)
cf-cli    | [currently v6] CLI tool to interact with the Cloudfoundry API | Cloudfoundry | [cloudfoundry/cli](https://github.com/cloudfoundry/cli)
cf6-cli    | v6 CLI tool to interact with the Cloudfoundry API | Cloudfoundry | [cloudfoundry/cli](https://github.com/cloudfoundry/cli)
cf7-cli    | v7 beta CLI tool to interact with the Cloudfoundry API | Cloudfoundry | [cloudfoundry/cli](https://github.com/cloudfoundry/cli)
credhub-cli | CLI tool to interact with a CredHub server | Cloudfoundry | [cloudfoundry-community/credhub-cli](https://github.com/cloudfoundry-incubator/credhub-cli)
direnv    | Environment switcher for the shell | direnv | [direnv/direnv](https://github.com/direnv/direnv)
genesis   | BOSH Deployment Paradigm | Stark & Wayne | [starkandwayne/genesis](https://github.com/starkandwayne/genesis)
gotcha    | Small HTTP/HTTPS MITM proxy, to troubleshoot encrypted HTTP traffic | Stark & Wayne | [starkandwayne/gotcha](https://github.com/starkandwayne/gotcha)
govc      | vSphere CLI built on top of govmomi | VMWare | [vmware/govmomi](https://github.com/vmware/govmomi)
hub       | CLI tool that wraps git in order to extend it with extra features | GitHub | [github/hub](https://github.com/github/hub)
install-debs-in-order | Install Debian packages in order | Stark & Wayne | [starkandwayne/install-debs-in-order](https://github.com/starkandwayne/install-debs-in-order)
jq        | Command-line JSON processor, like `sed` for JSON. | Stedolan | [stedolan/jq](https://github.com/stedolan/jq)
kafka-service-broker | CLI tool to interact with Kafka/ZooKeeper OSB | Stark & Wayne | [starkandwayne/kafka-service-broker](https://github.com/starkandwayne/kafka-service-broker)
om        | CLI tool to deploy products with Ops Manager | Pivotal | [pivotal-cf/om](https://github.com/pivotal-cf/om)
pivnet-cli | CLI tool to interact with the Pivotal Network | Pivotal | [pivotal-cf/pivnet-cli](https://github.com/pivotal-cf/pivnet-cli)
quaa      | Tool to quickly deploy/run the Cloud Foundry UAA locally, or to a remote platform/cloud | Stark & Wayne | [quaa](https://github.com/starkandwayne/quaa)
riff      | CLI tool that helps developers build and run functions using Knative | Pivotal | [projectriff/riff](https://github.com/projectriff/riff)
safe      | CLI tool to interact with a Vault server | Stark & Wayne | [starkandwayne/safe](https://github.com/starkandwayne/safe)
shield    | CLI tool to interact with SHIELD, a data protection offering | Stark & Wayne | [starkandwayne/shield](https://github.com/starkandwayne/shield)
spruce    | General purpose YAML & JSON merging tool | geoffranks et al. | [geoffranks/spruce](https://github.com/geoffranks/spruce)
terraform | Tool for building, changing, and combining infrastructure safely | HashiCorp | [hashicorp/terraform](https://github.com/hashicorp/terraform)
uaa-cli   | Experimental CLI for UAA written in Golang | Various | [cloudfoundry-community/uaa-cli](https://github.com/cloudfoundry-community/uaa-cli)
vault     | Secrets management, encryption as a service, and privileged access management | HashiCorp | [hashicorp/vault](https://github.com/hashicorp/vault)
aliyun-cli | Alibaba Cloud CLI | Alibaba Cloud | [aliyun/aliyun-cli](https://github.com/aliyun/aliyun-cli)
minica | MiniCA | Jacob Hoffman-Andrews | [jsha/minica](https://github.com/jsha/minica)


_Please note that the `vault` package was manually created by
https://gist.github.com/drnic/c03bf5929c7da3421e3978058845512b. The CI pipeline
needs a way to detect and fetch latest Vault CLI downloads._

To update the static site's index.html, run:

```plain
aws s3 sync apt/ s3://apt.starkandwayne.com/
```

## CI

The CI pipeline to automatically update these Homebrew & Debian packages is:

- Hosted at https://ci2.starkandwayne.com/teams/starkandwayne/pipelines/homebrew-cf
- Defined at https://github.com/starkandwayne/homebrew-cf under the ci/ folder
