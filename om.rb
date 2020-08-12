require "fileutils"

class Om < Formula
  homepage "https://github.com/pivotal-cf/om"

  v = "v6.1.2" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin-#{@@verNum}"
  version @@verNum
  sha256 "959cc69471c376855c9ea6d980fede5371f86e6dc6c1e0813e72d0bf1d96cce8" # CI Managed

  def install
    FileUtils.mv("om-darwin-#{@@verNum}", "om")
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
