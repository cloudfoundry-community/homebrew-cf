require "fileutils"

class Fissile < Formula
  homepage "https://github.com/cloudfoundry-incubator/fissile"

  v = "v7.0.0+354.gacefcfa4" # CI Managed
  v_safe = v.gsub("+", "%2B").gsub(%{^v}, "")
  url "http://cf-opensusefs2.s3.amazonaws.com/fissile/develop/fissile-#{v_safe}.darwin-amd64.tgz"
  version v
  sha256 "83bafee201f1fba80aad174a731a7528d331f5dee68c80d45d42d18510d29162" # CI Managed

  def install
    FileUtils.mv("fissile-darwin-amd64", "fissile")
    bin.install "fissile"
  end

  test do
    system "#{bin}/fissile", "version"
  end
end
