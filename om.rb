require "fileutils"

class Om < Formula
  homepage "https://github.com/pivotal-cf/om"

  v = "v6.5.0" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin-#{@@verNum}"
  version @@verNum
  sha256 "cfb7347d1844f51d7db981f2760056ac599e7797a6b30bd77515a8ae5b4b50dc" # CI Managed

  def install
    FileUtils.mv("om-darwin-#{@@verNum}", "om")
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
