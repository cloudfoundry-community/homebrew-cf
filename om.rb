require "FileUtils"

class Om < Formula
  homepage "https://github.com/pivotal-cf/om"

  v = "v0.46.0" # CI Managed
  url "https://github.com/pivotal-cf/om/releases/download/#{v}/om-darwin"
  version v
  sha256 "5184ac2b3d0b83549d93b2aedd9f011b9c816bf0a711ef897d352429d07152bb" # CI Managed

  def install
    FileUtils.mv("om-darwin", "om")
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
