require "fileutils"

class Om < Formula
  homepage "https://github.com/pivotal-cf/om"

  v = "v7.1.0" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin-#{@@verNum}"
  version @@verNum
  sha256 "83a8a0f839e77658c48b80df1026e5003a46a13a247d46c47bccb8b8d6386464" # CI Managed

  def install
    FileUtils.mv("om-darwin-#{@@verNum}", "om")
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
