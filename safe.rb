require "fileutils"

class Safe < Formula
  homepage "https://github.com/cloudfoundry-community/safe"

  v = "v1.23.0" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/cloudfoundry-community/safe/releases/download/#{v}/safe-#{v.gsub(/v/,"")}-darwin-amd64"
  version v
  sha256 "48c80e5e1c13f13c0f585a18315ba33bcbf640090bf7dfdcaa9805f23a07a181" # CI Managed

  def install
    FileUtils.mv("safe-#{@@verNum}-darwin-amd64", "safe")
    bin.install "safe"
  end

  test do
    system "#{bin}/safe", "--version"
  end
end
