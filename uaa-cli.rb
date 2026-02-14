require "fileutils"

class UaaCli < Formula
  homepage "https://github.com/cloudfoundry-incubator/uaa-cli"

  v = "v0.18.0" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/cloudfoundry-incubator/uaa-cli/releases/download/#{@@verNum}/uaa-darwin-amd64-#{@@verNum}"
  version v
  sha256 "c0d2f3727ff02f60570dbd7c7b83caac3d09904ae0a507eb2f50c3622c515504" # CI Managed

  def install
    FileUtils.mv("uaa-darwin-amd64-#{@@verNum}", "uaa")
    bin.install "uaa"
  end

  test do
    system "#{bin}/uaa", "-h"
  end
end

