require "fileutils"

class Safe < Formula
  homepage "https://github.com/cloudfoundry-community/safe"

  v = "v1.26.1" # CI Managed
  @@verNum = v.sub "v", ""
  version v

  if Hardware::CPU.arm?
    url "https://github.com/cloudfoundry-community/safe/releases/download/#{v}/safe-#{@@verNum}-darwin-arm64"
    sha256 "9cfd26cae227bf52cd8de07f67ba1814f84f2c2a904cb67c68f62ae387d49543" # CI Managed arm64
  else
    url "https://github.com/cloudfoundry-community/safe/releases/download/#{v}/safe-#{@@verNum}-darwin-amd64"
    sha256 "bac74bb204c145dd7eae47adcb1221fdd21dac8e582ddafa46f8f6b5b9b7ca27" # CI Managed
  end

  def install
    FileUtils.mv(Dir["safe-#{@@verNum}-darwin-*"].first, "safe")
    bin.install "safe"
  end

  test do
    system "#{bin}/safe", "--version"
  end
end
