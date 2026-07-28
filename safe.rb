require "fileutils"

class Safe < Formula
  homepage "https://github.com/cloudfoundry-community/safe"

  v = "v1.10.0" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/cloudfoundry-community/safe/releases/download/#{v}/safe-#{v.gsub(/v/,"")}-darwin-amd64"
  version v
  sha256 "b3991dca4ea5d9b2f4b7bc7dec76bc09ebadb54250d000d35bf61cc00d174a49" # CI Managed

  def install
    FileUtils.mv("safe-#{@@verNum}-darwin-amd64", "safe")
    bin.install "safe"
  end

  test do
    system "#{bin}/safe", "--version"
  end
end
