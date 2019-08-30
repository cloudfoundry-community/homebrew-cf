require "fileutils"

class Om < Formula
  homepage "https://github.com/pivotal-cf/om"

  v = "v3.2.2" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin-#{@@verNum}"
  version @@verNum
  sha256 "ed7197347beb03c30be5108220af17d17f53f2fabc438d5c39c68e4b8a7e4b04" # CI Managed

  def install
    FileUtils.mv("om-darwin-#{@@verNum}", "om")
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
