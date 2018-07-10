require "FileUtils"

class UaaCli < Formula
  homepage "https://github.com/cloudfoundry-incubator/uaa-cli"

  v = "v8.0.12" # CI Managed
  url "https://github.com/starkandwayne/uaa-cli-releases/releases/download/#{v}/uaa-darwin-amd64"
  version v
  sha256 "233e9a2ff69820d0c8fe637ef1a069c3336706225c3bcac77cf3cf47d70cdaed" # CI Managed

  def install
    FileUtils.mv("uaa-darwin-amd64", "uaa")
    bin.install "uaa"
  end

  test do
    system "#{bin}/uaa", "-h"
  end
end

