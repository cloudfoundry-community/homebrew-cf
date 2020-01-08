require "fileutils"

class Om < Formula
  homepage "https://github.com/pivotal-cf/om"

  v = "v4.4.1" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin-#{@@verNum}"
  version @@verNum
  sha256 "f5b8b51a09bed5d663fdef3f9c3eeb9599037e493f5a1cb3ff7cda4b12667224" # CI Managed

  def install
    FileUtils.mv("om-darwin-#{@@verNum}", "om")
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
