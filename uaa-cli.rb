require "FileUtils"

class UaaCli < Formula
  homepage "https://github.com/cloudfoundry-incubator/uaa-cli"

  v = "v0.0.1" # CI Managed
  url "https://github.com/starkandwayne/uaa-cli-releases/releases/download/#{v}/uaa-darwin-amd64"
  version v
  sha256 "9774626b69bf58a09266e0aeb5f8036d4bdf8b5a4fff02d63e953aff4b0eacf0" # CI Managed

  def install
    FileUtils.mv("uaa-darwin-amd64", "uaa")
    bin.install "uaa"
  end

  test do
    system "#{bin}/uaa", "-h"
  end
end

