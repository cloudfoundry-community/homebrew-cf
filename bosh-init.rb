require "FileUtils"

class BoshInit < Formula
  homepage "https://github.com/cloudfoundry/bosh-init"

  v = "v0.0.98" # CI Managed
  # remove v from version number
  @@verNum = v.sub "v", "" 
  url "https://s3.amazonaws.com/bosh-init-artifacts/bosh-init-#{@@verNum}-darwin-amd64"
  version v
  sha256 "05f3b10c9adb78d45c367b902bec37e8379c5a044d45fde55d0a42b916a8eb40" # CI Managed

  def install
    FileUtils.mv("bosh-init-#{@@verNum}-darwin-amd64", "bosh-init")
    bin.install "bosh-init"
  end

  test do
    system "#{bin}/bosh-init", "--version"
  end
end
