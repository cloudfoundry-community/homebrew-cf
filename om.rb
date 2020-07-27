require "fileutils"

class Om < Formula
  homepage "https://github.com/pivotal-cf/om"

  v = "v6.1.0" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin-#{@@verNum}"
  version @@verNum
  sha256 "081c856ecf3f671ff060577468081bc35415b1df7ee7cf4ed3544c876e219772" # CI Managed

  def install
    FileUtils.mv("om-darwin-#{@@verNum}", "om")
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
