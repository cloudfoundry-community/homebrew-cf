require "fileutils"

class Om < Formula
  homepage "https://github.com/pivotal-cf/om"

  v = "v6.3.0" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin-#{@@verNum}"
  version @@verNum
  sha256 "8c8fbc9f29c32c3028df52f152b8e6b9d3591621ab3311cfe841615d2d873d7a" # CI Managed

  def install
    FileUtils.mv("om-darwin-#{@@verNum}", "om")
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
