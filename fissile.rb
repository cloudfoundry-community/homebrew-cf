require "fileutils"

class Fissile < Formula
  homepage "https://github.com/cloudfoundry-incubator/fissile"

  v = "v7.0.0+374.gb8e8e6af" # CI Managed
  v_safe = v.gsub("+", "%2B").gsub(%r{^v}, "")
  url "http://cf-opensusefs2.s3.amazonaws.com/fissile/develop/fissile-#{v_safe}.darwin-amd64.tgz"
  version v
  sha256 "4ceedcda5a2164e653fee85b391b8084aba44bb31c230b0a8a9fbda991670db3" # CI Managed

  def install
    bin.install "fissile"
  end

  test do
    system "#{bin}/fissile", "version"
  end
end
