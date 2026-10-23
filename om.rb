require "fileutils"

class Om < Formula
  homepage "https://github.com/pivotal-cf/om"

  v = "v7.22.3" # CI Managed
  @@verNum = v.sub "v", ""
  version @@verNum

  if Hardware::CPU.arm?
    url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin-arm64-#{@@verNum}"
    sha256 "afd48165d29329f607b07eca0c2fd8401a160880f08f33fa7495180842d83e2c" # CI Managed arm64
  else
    url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin-amd64-#{@@verNum}"
    sha256 "d8d2a0e221edd710d2d6693aa5325f9e4034dd841f24506e8ee3ee4b79fdfcce" # CI Managed
  end

  def install
    FileUtils.mv(Dir["om-darwin-*-#{@@verNum}"].first, "om")
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
