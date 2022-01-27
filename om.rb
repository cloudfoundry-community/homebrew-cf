require "fileutils"

class Om < Formula
  homepage "https://github.com/pivotal-cf/om"

  v = "v7.5.0" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin-#{@@verNum}"
  version @@verNum
  sha256 "01d7d3e6b5ddc6e404b001fddffd391eccc4653d42c9f3c507d689619d849d5f" # CI Managed

  def install
    FileUtils.mv("om-darwin-#{@@verNum}", "om")
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
