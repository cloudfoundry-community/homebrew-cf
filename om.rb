require "fileutils"

class Om < Formula
  homepage "https://github.com/pivotal-cf/om"

  v = "v4.0.1" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin-#{@@verNum}"
  version @@verNum
  sha256 "3ddc2323078070d7a52ba2a699c1b327e77f136b681e64e7a46b9f2810d1e20e" # CI Managed

  def install
    FileUtils.mv("om-darwin-#{@@verNum}", "om")
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
