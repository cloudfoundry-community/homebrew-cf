require "fileutils"

class Safe < Formula
  homepage "https://github.com/cloudfoundry-community/safe"

  v = "v1.20.0" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/cloudfoundry-community/safe/releases/download/#{v}/safe-#{v.gsub(/v/,"")}-darwin-amd64"
  version v
  sha256 "a1b8424467418cfa1d0c040a232954f56da2a41c6ee95f6477b796f1bef10da2" # CI Managed

  def install
    FileUtils.mv("safe-#{@@verNum}-darwin-amd64", "safe")
    bin.install "safe"
  end

  test do
    system "#{bin}/safe", "--version"
  end
end
