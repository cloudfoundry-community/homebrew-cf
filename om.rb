require "fileutils"

class Om < Formula
  homepage "https://github.com/pivotal-cf/om"

  v = "v5.0.0" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin-#{@@verNum}"
  version @@verNum
  sha256 "f942df53890b9132b6e88d4faba776be08c36221b8e3b6f79f9f0d3950d013f8" # CI Managed

  def install
    FileUtils.mv("om-darwin-#{@@verNum}", "om")
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
