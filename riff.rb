require "fileutils"

class Riff < Formula
  homepage "https://github.com/projectriff/riff"

  v = "v0.3.1" # CI Managed
  url "https://github.com/projectriff/riff/releases/download/#{v}/riff-darwin-amd64.tgz"
  version v
  sha256 "b1e250e7478427449cea7a0921779fade68f6cf9ef8c1cbbf6ecc291ca9cc5a5" # CI Managed

  def gunzip(filename)
    command = "gunzip --force #{filename}"
    success = system(command)

    success && $?.exitstatus == 0
  end

  def install
    # FileUtils.mv("riff-darwin-amd64", "riff")
    bin.install "riff"
  end

  test do
    system "#{bin}/riff", "version"
  end
end

