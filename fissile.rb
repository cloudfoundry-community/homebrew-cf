require "fileutils"

class Fissile < Formula
  homepage "https://github.com/cloudfoundry-incubator/fissile"

  v = "v7.0.0+367.g6b06e343" # CI Managed
  v_safe = v.gsub("+", "%2B").gsub(%r{^v}, "")
  url "http://cf-opensusefs2.s3.amazonaws.com/fissile/develop/fissile-#{v_safe}.darwin-amd64.tgz"
  version v
  sha256 "0eb4b2fdf03bd2dd00825c8a61a89c46f44e4948b3332fa379f027b6d0050707" # CI Managed

  def install
    bin.install "fissile"
  end

  test do
    system "#{bin}/fissile", "version"
  end
end
