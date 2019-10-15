require "fileutils"

class Fissile < Formula
  homepage "https://github.com/cloudfoundry-incubator/fissile"

  v = "v7.0.0+360.g0ec8d681" # CI Managed
  v_safe = v.gsub("+", "%2B").gsub(%r{^v}, "")
  url "http://cf-opensusefs2.s3.amazonaws.com/fissile/develop/fissile-#{v_safe}.darwin-amd64.tgz"
  version v
  sha256 "9a602fcd07f2b18dc059a7a8e3d769bc0150f0785e0aaad77f8a059af9a4261a" # CI Managed

  def install
    bin.install "fissile"
  end

  test do
    system "#{bin}/fissile", "version"
  end
end
