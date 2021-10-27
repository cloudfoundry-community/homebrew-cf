require "fileutils"

class Om < Formula
  homepage "https://github.com/pivotal-cf/om"

  v = "v7.4.0" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin-#{@@verNum}"
  version @@verNum
  sha256 "0f08f2315bf502cdc337471aa9d4ad083d15be64ba4c13f2012840b75b36ac43" # CI Managed

  def install
    FileUtils.mv("om-darwin-#{@@verNum}", "om")
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
