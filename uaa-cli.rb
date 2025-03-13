require "fileutils"

class UaaCli < Formula
  homepage "https://github.com/cloudfoundry-incubator/uaa-cli"

  v = "v0.16.0" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/cloudfoundry-incubator/uaa-cli/releases/download/#{@@verNum}/uaa-darwin-amd64-#{@@verNum}"
  version v
  sha256 "5efae49cc8f66829e4daaec71e931700d8a2fe5fab85c265286787b616a7e9a5" # CI Managed

  def install
    FileUtils.mv("uaa-darwin-amd64-#{@@verNum}", "uaa")
    bin.install "uaa"
  end

  test do
    system "#{bin}/uaa", "-h"
  end
end

