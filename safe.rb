require "fileutils"

class Safe < Formula
  homepage "https://github.com/cloudfoundry-community/safe"

  v = "v1.24.0" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/cloudfoundry-community/safe/releases/download/#{v}/safe-#{v.gsub(/v/,"")}-darwin-amd64"
  version v
  sha256 "bb004de9e04af562bb3e99d39378c1db15d78c45142f3158c093e6577f68f63b" # CI Managed

  def install
    FileUtils.mv("safe-#{@@verNum}-darwin-amd64", "safe")
    bin.install "safe"
  end

  test do
    system "#{bin}/safe", "--version"
  end
end
