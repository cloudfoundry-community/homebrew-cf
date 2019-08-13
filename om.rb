require "fileutils"

class Om < Formula
  homepage "https://github.com/pivotal-cf/om"

  v = "v3.1.0" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin-#{@@verNum}"
  version @@verNum
  sha256 "3051729f4e96a09f8981db0afb44c3e15bbeb9957914f6556c142a0e514f38de" # CI Managed

  def install
    FileUtils.mv("om-darwin-#{@@verNum}", "om")
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
