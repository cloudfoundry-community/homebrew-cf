require "fileutils"

class Safe < Formula
  homepage "https://github.com/cloudfoundry-community/safe"

  v = "v1.24.0" # CI Managed
  @@verNum = v.sub "v", ""
  version v

  if Hardware::CPU.arm?
    url "https://github.com/cloudfoundry-community/safe/releases/download/#{v}/safe-#{@@verNum}-darwin-arm64"
    sha256 "c2044b6a74e519fce4aa6f2e80d853f111d09fe28cc31338de4c72d7fde7cd95" # CI Managed arm64
  else
    url "https://github.com/cloudfoundry-community/safe/releases/download/#{v}/safe-#{@@verNum}-darwin-amd64"
    sha256 "bb004de9e04af562bb3e99d39378c1db15d78c45142f3158c093e6577f68f63b" # CI Managed
  end

  def install
    FileUtils.mv(Dir["safe-#{@@verNum}-darwin-*"].first, "safe")
    bin.install "safe"
  end

  test do
    system "#{bin}/safe", "--version"
  end
end
