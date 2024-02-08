require "fileutils"

class Safe < Formula
  homepage "https://github.com/cloudfoundry-community/safe"

  v = "v1.9.0" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/cloudfoundry-community/safe/releases/download/#{v}/safe-#{v.gsub(/v/,"")}-darwin-amd64"
  version v
  sha256 "6854eb15989f7e4bc16d231fc28a041058922fc52da92211e1df07ff502eb6a1" # CI Managed

  def install
    FileUtils.mv("safe-#{@@verNum}-darwin-amd64", "safe")
    bin.install "safe"
  end

  test do
    system "#{bin}/safe", "--version"
  end
end
