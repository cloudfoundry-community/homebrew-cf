require "fileutils"

class Om < Formula
  homepage "https://github.com/pivotal-cf/om"

  v = "v3.2.0" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin-#{@@verNum}"
  version @@verNum
  sha256 "82364fef9374fe0a18d37d184ed638b3704e8ec218b6d898c43e40101ea0910c" # CI Managed

  def install
    FileUtils.mv("om-darwin-#{@@verNum}", "om")
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
