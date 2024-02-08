require "fileutils"

class UaaCli < Formula
  homepage "https://github.com/cloudfoundry-incubator/uaa-cli"

  v = "v0.13.0" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/cloudfoundry-incubator/uaa-cli/releases/download/#{@@verNum}/uaa-darwin-amd64-#{@@verNum}"
  version v
  sha256 "cec4fc93dd49204e8c6a2a5478d09fb09123095c24543262ee81ea0e1006166e" # CI Managed

  def install
    FileUtils.mv("uaa-darwin-amd64-#{@@verNum}", "uaa")
    bin.install "uaa"
  end

  test do
    system "#{bin}/uaa", "-h"
  end
end

