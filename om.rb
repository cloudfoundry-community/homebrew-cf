require "FileUtils"

class Om < Formula
  homepage "https://github.com/pivotal-cf/om"

  v = "v0.49.0" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin"
  version @@verNum
  sha256 "8ca630fa8e65f3664968118ddbdf5dd6379dd2eab2c136a6b05d8f18cb27947c" # CI Managed

  def install
    FileUtils.mv("om-darwin", "om")
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
