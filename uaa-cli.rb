require "fileutils"

class UaaCli < Formula
  homepage "https://github.com/cloudfoundry-incubator/uaa-cli"

  v = "v0.10.0" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/cloudfoundry-incubator/uaa-cli/releases/download/#{@@verNum}/uaa-darwin-amd64-#{@@verNum}"
  version v
  sha256 "482cd886a2abd60678c292b126e4c869c1305a610fbe8d05a78207e22edeff88" # CI Managed

  def install
    FileUtils.mv("uaa-darwin-amd64-#{@@verNum}", "uaa")
    bin.install "uaa"
  end

  test do
    system "#{bin}/uaa", "-h"
  end
end

