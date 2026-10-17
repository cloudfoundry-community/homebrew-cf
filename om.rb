require "fileutils"

class Om < Formula
  homepage "https://github.com/pivotal-cf/om"

  v = "v7.22.2" # CI Managed
  @@verNum = v.sub "v", ""
  version @@verNum

  if Hardware::CPU.arm?
    url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin-arm64-#{@@verNum}"
    sha256 "2d445d2645238336e31dbb292acd9b20aeb650a63986198d4ae97a301a1d32cd" # CI Managed arm64
  else
    url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin-amd64-#{@@verNum}"
    sha256 "f18eaad1b80593830bdd77a1f1cd016d63208d682db188c9e0fe8cebb1a65eca" # CI Managed
  end

  def install
    FileUtils.mv(Dir["om-darwin-*-#{@@verNum}"].first, "om")
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
