require "FileUtils"

class Om < Formula
  homepage "https://github.com/pivotal-cf/om"

  v = "v3.0.0" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin-#{@@verNum}"
  version @@verNum
  sha256 "a6a021f15c1290b019f24236de40a619ff5eb61de3cc55fc21602adf397c0a99" # CI Managed

  def install
    FileUtils.mv("om-darwin-#{@@verNum}", "om")
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
