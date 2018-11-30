require "FileUtils"

class Om < Formula
  homepage "https://github.com/pivotal-cf/om"

  v = "v0.47.0" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin"
  version @@verNum
  sha256 "585a69ee734e834fcc0cdbfe3c1cc89e7c7e6a40194fa7ce612163735f86c88c" # CI Managed

  def install
    FileUtils.mv("om-darwin", "om")
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
