require "fileutils"

class Om < Formula
  homepage "https://github.com/pivotal-cf/om"

  v = "v4.0.0" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin-#{@@verNum}"
  version @@verNum
  sha256 "d33df882605d8736758e423fc72837919ebe1c7d5b15cd78e4f1ecc5485c8ff5" # CI Managed

  def install
    FileUtils.mv("om-darwin-#{@@verNum}", "om")
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
