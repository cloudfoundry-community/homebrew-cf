require "fileutils"

class Om < Formula
  homepage "https://github.com/pivotal-cf/om"

  v = "v7.0.2" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin-#{@@verNum}"
  version @@verNum
  sha256 "8bf4fe6ed1507918d5c3c63d083a9c80f4c13779fa5822f27ce13ae545dc0ce4" # CI Managed

  def install
    FileUtils.mv("om-darwin-#{@@verNum}", "om")
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
