require "FileUtils"

class Om < Formula
  homepage "https://github.com/pivotal-cf/om"

  v = "v0.55.0" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin"
  version @@verNum
  sha256 "779fed295865df1316a81dc7975cd1234a71b70bd445002e9a27a1124a4c30ac" # CI Managed

  def install
    FileUtils.mv("om-darwin", "om")
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
