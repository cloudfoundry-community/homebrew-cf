# CF Community Homebrew Tap & APT Repository

Homebrew Tap & Debian Packages for useful BOSH / Cloud Foundry / Kubernetes
utilities. These were initially created by Stark & Wayne and contains some
software they had written, and other community tools that have been found
valuable in day-to-day operations with CF and Kubernetes.

## Homebrew Tap

Tap the formula repository:
```plain
brew tap cloudfoundry-community/cf
```


Current software offered:

| Package | Description | Author | Source |
| ------- | ----------- | ------ | ------ |
eden      | CLI tool to interact with any Open Service Broker API                | Stark & Wayne     | [starkandwayne/eden][eden]
genesis   | BOSH Deployment Paradigm                                             | Stark & Wayne     | [starkandwayne/genesis][genesis]
gotcha    | Small HTTP/HTTPS MITM proxy, to troubleshoot encrypted HTTP traffic  | Stark & Wayne     | [starkandwayne/gotcha][gotcha]
govc      | vSphere CLI built on top of govmomi                                  | VMWare            | [vmware/govmomi][govmomi]
kafka-service-broker | CLI tool to interact with Kafka/ZooKeeper OSB             | Stark & Wayne     | [starkandwayne/kafka-service-broker][kafka_svc_bkr]
quaa      | Tool to quickly deploy/run the Cloud Foundry UAA locally, or to a remote platform/cloud | Stark & Wayne | [quaa][quaa]
riff      | CLI tool that helps developers build and run functions using Knative | Pivotal           | [projectriff/riff][riff]
safe      | CLI tool to interact with a Vault server                             | Stark & Wayne     | [starkandwayne/safe][safe]
shield    | CLI tool to interact with SHIELD, a data protection offering         | Stark & Wayne     | [starkandwayne/shield][shield]
spruce    | General purpose YAML & JSON merging tool                             | geoffranks et al. | [geoffranks/spruce][spruce]
uaa-cli   | Experimental CLI for UAA written in Golang                           | Various           | [cloudfoundry-community/uaa-cli][uaa_cli]

[eden]: https://github.com/starkandwayne/eden
[genesis]: https://github.com/starkandwayne/genesis
[gotcha]: https://github.com/starkandwayne/gotcha
[govmomi]: https://github.com/vmware/govmomi
[kafka_svc_bkr]: https://github.com/starkandwayne/kafka-service-broker
[quaa]: https://github.com/starkandwayne/quaa
[riff]: https://github.com/projectriff/riff
[safe]: https://github.com/starkandwayne/safe
[shield]: https://github.com/starkandwayne/shield
[spruce]: https://github.com/geoffranks/spruce
[uaa_cli]: https://github.com/cloudfoundry-community/uaa-cli

To install a package from our tap, run:

`brew install cloudfoundry-community/cf/<package>`, e.g. `brew install cloudfoundry-community/cf/safe`

_Please note that while some of the above software is provided by other
formulas, we only support installations from our tap. Other taps contain
mismatched dependency versions which outright break some of our software.
Please make sure you prefix package names with
`cloudfoundry-community/cf/<package>` to avoid installing an unsupported
version._

## Debian packages

This project automatically packages several CLI binaries as Debian packages as
well. To add our APT repository to your OS:

```plain
wget -q -O - https://raw.githubusercontent.com/cloudfoundry-community/homebrew-cf/master/public.key | apt-key add -
echo "deb http://apt.community.cloudfoundry.org stable main" | tee /etc/apt/sources.list.d/starkandwayne.list
apt-get update
```

The above snippet will add our GPG key to your APT keychain, add the
repository, and update your cache.

The following packages are provided by the APT repository:

|  Package  | Description | Author | Source |
| --------- | ----------- | ------ | ------ |
bosh-cli    | CLI tool to interact with a BOSH director                                   | Cloudfoundry  | [cloudfoundry/bosh-cli][bosh_cli]
bosh-bootloader | CLI tool for standing up a BOSH director                                | Cloudfoundry  | [cloudfoundry/bosh-bootloader][bbl]
eden        | CLI tool to interact with any Open Service Broker API                       | Stark & Wayne | [starkandwayne/eden][eden]
certstrap   | Tools to bootstrap CAs, certificate requests, and signed certificates.      | Square        | [square/certstrap][certstrap]
cf-cli      | [currently v6, PRs welcome] CLI tool to interact with the Cloudfoundry API  | Cloudfoundry  | [cloudfoundry/cli][cf_cli]
cf6-cli     | legacy v6 CLI tool to interact with the Cloudfoundry API                    | Cloudfoundry  | [cloudfoundry/cli][cf_cli]
cf7-cli     | v7 CLI tool to interact with the Cloudfoundry API                           | Cloudfoundry  | [cloudfoundry/cli][cf_cli]
~~cf8-cli~~ | v8 CLI tool is not yet provided, PRs are welcome                            | Cloudfoundry  | [cloudfoundry/cli][cf_cli]
credhub-cli | CLI tool to interact with a CredHub server                                  | Cloudfoundry  | [cloudfoundry-community/credhub-cli][credhub_cli]
direnv      | Environment switcher for the shell                                          | direnv        | [direnv/direnv][direnv]
genesis     | BOSH Deployment Paradigm                                                    | Stark & Wayne | [starkandwayne/genesis][genesis]
gotcha      | Small HTTP/HTTPS MITM proxy, to troubleshoot encrypted HTTP traffic         | Stark & Wayne | [starkandwayne/gotcha][gotcha]
govc        | vSphere CLI built on top of govmomi                                         | VMWare        | [vmware/govmomi][govmomi]
hub         | CLI tool that wraps git in order to extend it with extra features           | GitHub        | [github/hub][hub]
install-debs-in-order | Install Debian packages in order                                  | Stark & Wayne | [starkandwayne/install-debs-in-order][debs_in_order]
jq          | Command-line JSON processor, like `sed` for JSON.                           | Stedolan      | [stedolan/jq][jq]
kafka-service-broker | CLI tool to interact with Kafka/ZooKeeper OSB                      | Stark & Wayne | [starkandwayne/kafka-service-broker][kafka_svc_bkr]
om          | CLI tool to deploy products with Ops Manager                                | Pivotal       | [pivotal-cf/om][om]
pivnet-cli  | CLI tool to interact with the Pivotal Network                               | Pivotal       | [pivotal-cf/pivnet-cli][pivnet]
quaa        | Tool to quickly deploy/run the Cloud Foundry UAA locally, or to a remote platform/cloud | Stark & Wayne | [quaa][quaa]
riff        | CLI tool that helps developers build and run functions using Knative          | Pivotal       | [projectriff/riff][riff]
safe        | CLI tool to interact with a Vault server                                      | Stark & Wayne | [starkandwayne/safe][safe]
shield      | CLI tool to interact with SHIELD, a data protection offering                  | Stark & Wayne | [starkandwayne/shield][shield]
spruce      | General purpose YAML & JSON merging tool                                  | geoffranks et al. | [geoffranks/spruce][spruce]
terraform   | Tool for building, changing, and combining infrastructure safely              | HashiCorp     | [hashicorp/terraform][terraform]
uaa-cli     | Experimental CLI for UAA written in Golang                                    | Various       | [cloudfoundry-community/uaa-cli][uaa_cli]
vault       | Secrets management, encryption as a service, and privileged access management | HashiCorp     | [hashicorp/vault][vault]
aliyun-cli  | Alibaba Cloud CLI                                                   | Alibaba Cloud           | [aliyun/aliyun-cli][alicli]
minica      | MiniCA                                                              | Jacob Hoffman-Andrews   | [jsha/minica][minica]

[bosh_cli]: https://github.com/cloudfoundry/bosh-cli
[bbl]: https://github.com/cloudfoundry/bosh-bootloader
[certstrap]: https://github.com/square/certstrap
[cf_cli]: https://github.com/cloudfoundry
[credhub_cli]: https://github.com/cloudfoundry-incubator/credhub-cli
[direnv]: https://github.com/direnv/direnv
[hub]: https://github.com/github/hub
[debs_in_order]: https://github.com/starkandwayne/install-debs-in-order
[jq]: https://github.com/stedolan/jq
[om]: https://github.com/pivotal-cf/om
[pivnet]: https://github.com/pivotal-cf/pivnet-cli
[terraform]: https://github.com/hashicorp/terraform
[vault]: https://github.com/hashicorp/vault
[alicli]: https://github.com/aliyun/aliyun-cli
[minica]: https://github.com/jsha/minica

To update the static site's index.html, run:

```plain
aws s3 sync apt/ s3://apt.community.cloudfoundry.org/
```

## CI

The CI pipeline to automatically update these Homebrew & Debian packages is:

- Pipeline is currently being migrated to a new Concourse
- Defined at https://github.com/cloudfoundry-community/homebrew-cf under the ci/ folder
