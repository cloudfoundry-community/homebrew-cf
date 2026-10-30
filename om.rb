require "fileutils"

class Om < Formula
  homepage "https://github.com/pivotal-cf/om"

  v = "v7.22.4" # CI Managed
  @@verNum = v.sub "v", ""
  version @@verNum

  if Hardware::CPU.arm?
    url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin-arm64-#{@@verNum}"
    sha256 "7164aa4c77170b3d3c3d4f737753733541ef37d68b9db2607a870ecb11a12ca9" # CI Managed arm64
  else
    url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin-amd64-#{@@verNum}"
    sha256 "aa0776fb4539415a61bb77ba1165901ffca3af00b9d948d92b980cbf9d3c3708" # CI Managed
  end

  def install
    FileUtils.mv(Dir["om-darwin-*-#{@@verNum}"].first, "om")
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
