require "fileutils"

class Om < Formula
  homepage "https://github.com/pivotal-cf/om"

  v = "v3.2.1" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin-#{@@verNum}"
  version @@verNum
  sha256 "c064dd1e31116acc6cd2ae3befbc8567e08e4a8ad1f8af9c24216a00c8a11cf7" # CI Managed

  def install
    FileUtils.mv("om-darwin-#{@@verNum}", "om")
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
