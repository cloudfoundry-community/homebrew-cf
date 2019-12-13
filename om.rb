require "fileutils"

class Om < Formula
  homepage "https://github.com/pivotal-cf/om"

  v = "v4.4.0" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin-#{@@verNum}"
  version @@verNum
  sha256 "5860cc62d8e88baec3ca028db1be153c1f9547f5ab436c95de7f7ec9372ac332" # CI Managed

  def install
    FileUtils.mv("om-darwin-#{@@verNum}", "om")
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
