require "fileutils"

class UaaCli < Formula
  homepage "https://github.com/cloudfoundry-incubator/uaa-cli"

  v = "v0.8.0" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/cloudfoundry-incubator/uaa-cli/releases/download/#{v}/uaa-darwin-amd64-#{@@verNum}"
  version v
  sha256 "d63bf174f37ae4af375a287c97127c7d8c0d3fb4fae5dd6e5337b2cb524a3796" # CI Managed

  def install
    FileUtils.mv("uaa-darwin-amd64-#{@@verNum}", "uaa")
    bin.install "uaa"
  end

  test do
    system "#{bin}/uaa", "-h"
  end
end

