require "FileUtils"

class Om < Formula
  homepage "https://github.com/pivotal-cf/om"

  v = "v0.50.0" # CI Managed
  @@verNum = v.sub "v", ""
  url "https://github.com/pivotal-cf/om/releases/download/#{@@verNum}/om-darwin"
  version @@verNum
  sha256 "2b28ef8a770bebfa726de8c38a3beab2302a6ee7f9c4a3f18b9a1cbf760b60da" # CI Managed

  def install
    FileUtils.mv("om-darwin", "om")
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
