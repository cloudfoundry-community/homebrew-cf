require "FileUtils"

class Bosh < Formula
  homepage "https://github.com/cloudfoundry/bosh-cli"

  v = "v5.2.2" # CI Managed
  # remove v from version number
  @@verNum = v.sub "v", ""
  url "https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-#{@@verNum}-darwin-amd64"
  version v
  sha256 "1403294849f4c0e624d0518d9f5bca445289007dad0e7a9e6bc6fd8a92dbe38d" # CI Managed

  def install
    FileUtils.mv("bosh-cli-#{@@verNum}-darwin-amd64", "bosh")
    bin.install "bosh"
  end

  test do
    system "#{bin}/bosh", "--version"
  end
end
