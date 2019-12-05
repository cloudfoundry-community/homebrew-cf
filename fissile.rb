require "fileutils"

class Fissile < Formula
  homepage "https://github.com/cloudfoundry-incubator/fissile"

  v = "v7.0.0+372.ge3509601" # CI Managed
  v_safe = v.gsub("+", "%2B").gsub(%r{^v}, "")
  url "http://cf-opensusefs2.s3.amazonaws.com/fissile/develop/fissile-#{v_safe}.darwin-amd64.tgz"
  version v
  sha256 "ebef93b58d7c97078a0b9203c63d862232de6e332b158bdb1b7d3187e3540278" # CI Managed

  def install
    bin.install "fissile"
  end

  test do
    system "#{bin}/fissile", "version"
  end
end
