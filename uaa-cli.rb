require "fileutils"

class UaaCli < Formula
  homepage "https://github.com/cloudfoundry-incubator/uaa-cli"

  v = "v0.22.0" # CI Managed
  @@verNum = v.sub "v", ""
  version v

  if Hardware::CPU.arm?
    url "https://github.com/cloudfoundry-incubator/uaa-cli/releases/download/v#{@@verNum}/uaa-darwin-arm64-#{@@verNum}"
    sha256 "c24c9e6e0913dccf3855ed0c369c48697faf165568ae423cf8ab9eea6406c03f" # CI Managed arm64
  else
    url "https://github.com/cloudfoundry-incubator/uaa-cli/releases/download/v#{@@verNum}/uaa-darwin-amd64-#{@@verNum}"
    sha256 "33eae67fe192f6409ef270bca7720e5987636e0941b9f3f72f813d44cf514bc9" # CI Managed
  end

  def install
    FileUtils.mv(Dir["uaa-darwin-*-#{@@verNum}"].first, "uaa")
    bin.install "uaa"
  end

  test do
    system "#{bin}/uaa", "-h"
  end
end
