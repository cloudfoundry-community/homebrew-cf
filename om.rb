require "fileutils"

class Om < Formula
  homepage "https://github.com/pivotal-cf/om"

  v = "v4.6.0" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin-#{@@verNum}"
  version @@verNum
  sha256 "93d64b4769cff796ed1ab37cad31f2764370e86e5ab284a1ece69981f58331df" # CI Managed

  def install
    FileUtils.mv("om-darwin-#{@@verNum}", "om")
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
