class Quaa < Formula
  desc "Quickly run Cloud Foundry UAA inside Apache Tomcat"
  homepage "https://github.com/starkandwayne/quaa"

  v = "v1.0.4" # CI Managed
  url "https://github.com/starkandwayne/quick-uaa-local/archive/#{v}.tar.gz"
  version v
  sha256 "bef7ecc603ef40aaf92b4eb31070853ea7e3968149e57b0ecda6ae6faee228d1" # CI Managed

  devel do
    url "https://github.com/starkandwayne/quick-uaa-local.git", using: :git
  end


  depends_on java: "1.8"
  depends_on "cloudfoundry/tap/bosh-cli" => "5.2.2"
  depends_on "starkandwayne/cf/uaa-cli" => "0.0.1"

  def install
    bosh_bin = File.join(Formula["cloudfoundry/tap/bosh-cli"].opt_bin, "bosh")
    uaa_bin  = File.join(Formula["starkandwayne/cf/uaa-cli"].opt_bin, "uaa")

    (share/"manifests").install Dir["*", ".versions"]

    quaa = <<-SHELL
#!/bin/bash

export BOSH_BIN=#{bosh_bin}
export UAA_BIN=#{uaa_bin}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

#{(share/"manifests/bin/quaa")} "$@"
SHELL
    bin.mkpath
    (bin/"quaa").binwrite(quaa)

    puts <<-README

    To run an in-memory UAA:

        quaa up

    To run the UAA backed by your local existing PostgreSQL database:

        quaa up --postgresql

    The UAA will be running at http://localhost:8080

    In another terminal, you can target & authorize the new "uaa" CLI:

        quaa auth-client

    Example "uaa" commands to try:

        uaa clients
        uaa users
        uss groups

    README
  end
end
