require "FileUtils"

class UaaCli < Formula
  homepage "https://github.com/cloudfoundry-incubator/uaa-cli"

  v = "v0.0.1" # CI Managed
  url "https://github.com/starkandwayne/uaa-cli-releases/releases/download/#{v}/uaa-darwin-amd64"
  version v
  sha256 "4171883b97d542e9b603e793cdf9d54d3b12f4dca1218998556b716f069aa47d" # CI Managed

  def install
    FileUtils.mv("uaa-darwin-amd64", "uaa")
    bin.install "uaa"
  end

  test do
    system "#{bin}/uaa", "-h"
  end
end

