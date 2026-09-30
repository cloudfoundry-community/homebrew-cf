require "fileutils"

class Om < Formula
  homepage "https://github.com/pivotal-cf/om"

  v = "v7.22.0" # CI Managed
  @@verNum = v.sub "v", ""
  version @@verNum

  if Hardware::CPU.arm?
    url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin-arm64-#{@@verNum}"
    sha256 "fa14f21bfc8ca1f7ce064bf71407b8f4d889364716c1c33551470b6064e02a1b" # CI Managed arm64
  else
    url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin-amd64-#{@@verNum}"
    sha256 "9c1f96638483b0789fd30199d491b4f4cbf6e40b0094d7f61412491b11b9a308" # CI Managed
  end

  def install
    FileUtils.mv(Dir["om-darwin-*-#{@@verNum}"].first, "om")
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
