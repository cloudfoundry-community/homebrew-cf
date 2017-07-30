A homebrew tap for useful BOSH / Cloud Foundry utilities

To enable:

```
$ brew tap starkandwayne/cf
```

Current brews offered:

- [spruce](https://github.com/geofffranks/spruce)
- [genesis](https://github.com/starkandwayne/genesis)
- [gotcha](https://github.com/starkandwayne/gotcha)
- [safe](https://github.com/starkandwayne/safe)
- [shield](https://github.com/starkandwayne/shield)
- [yaml2json](https://github.com/bronze1man/go-yaml2json)

```
$ brew install spruce
$ brew install gotcha
```

Coming soon:
- [cloudfoundry-utils](https://github.com/starkandwayne/cloudfoundry-utils)

## Debian packages

This project automatically packages several CLI binaries as Debian packages. To install:

```
echo "deb [trusted=yes] https://starkandwayne-debian-apt.s3.amazonaws.com stable main" > /etc/apt/sources.list.d/starkandwayne.list
apt-get update
apt-get install spruce
apt-get install gotcha
apt-get install safe
apt-get install shield
apt-get install bosh-cli
apt-get install vault
apt-get install genesis # also installs spruce, safe, vault, bosh-cli
```
