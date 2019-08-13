require "fileutils"

class UaaCli < Formula
  homepage "https://github.com/cloudfoundry-incubator/uaa-cli"

  v = "v0.0.1" # CI Managed
  url "https://github.com/starkandwayne/uaa-cli-releases/releases/download/#{v}/uaa-darwin-amd64"
  version v
  sha256 "1cf5209270c72aa501d8643597176d01ed02a6d08cf2bca26c73167928edf533" # CI Managed

  def install
    FileUtils.mv("uaa-darwin-amd64", "uaa")
    bin.install "uaa"
  end

  test do
    system "#{bin}/uaa", "-h"
  end
end

