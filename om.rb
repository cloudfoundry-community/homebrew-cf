require "fileutils"

class Om < Formula
  homepage "https://github.com/pivotal-cf/om"

  v = "v6.4.0" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin-#{@@verNum}"
  version @@verNum
  sha256 "1ce56c4a29a78e529d22fc24ab716c6929a3b14c330b4441e042b68fd09c9852" # CI Managed

  def install
    FileUtils.mv("om-darwin-#{@@verNum}", "om")
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
