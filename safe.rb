require "fileutils"

class Safe < Formula
  homepage "https://github.com/cloudfoundry-community/safe"

  v = "v1.25.1" # CI Managed
  @@verNum = v.sub "v", ""
  version v

  if Hardware::CPU.arm?
    url "https://github.com/cloudfoundry-community/safe/releases/download/#{v}/safe-#{@@verNum}-darwin-arm64"
    sha256 "993776d90f15514e24a037920e75ed33e790d73abdd9e98475bc2a2eeaaf249f" # CI Managed arm64
  else
    url "https://github.com/cloudfoundry-community/safe/releases/download/#{v}/safe-#{@@verNum}-darwin-amd64"
    sha256 "ad0d6435ef2c09416aa6644e3cfec8d5f14edaf50c3d7f306ac4bad9084a81da" # CI Managed
  end

  def install
    FileUtils.mv(Dir["safe-#{@@verNum}-darwin-*"].first, "safe")
    bin.install "safe"
  end

  test do
    system "#{bin}/safe", "--version"
  end
end
