require "FileUtils"

class Om < Formula
  homepage "https://github.com/pivotal-cf/om"

  v = "0.45.0" # CI Managed
  url "https://github.com/pivotal-cf/om/releases/download/#{v}/om-darwin"
  version v
  sha256 "fdf70b6238f09fe7d793916d2dd6565f0f75d877162c81e54e671c68257be048" # CI Managed

  def install
    FileUtils.mv("om-darwin", "om")
    bin.install "om"
  end

  test do
    system "#{bin}/om", "version"
  end
end
