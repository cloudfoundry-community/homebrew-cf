require "fileutils"

class Fissile < Formula
  homepage "https://github.com/cloudfoundry-incubator/fissile"

  v = "v7.0.0+354.gacefcfa4" # CI Managed
  v_safe = v.gsub("+", "%2B").gsub(%{^v}, "")
  url "http://cf-opensusefs2.s3.amazonaws.com/fissile/develop/fissile-#{v_safe}.darwin-amd64.tgz"
  version v
  sha256 "a0ce729dfade481b65f8770c09e08d9603e02640e123d2275dc73730d808635e" # CI Managed

  def install
    FileUtils.mv("fissile-darwin-amd64", "fissile")
    bin.install "fissile"
  end

  test do
    system "#{bin}/fissile", "version"
  end
end
