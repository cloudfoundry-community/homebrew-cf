require "FileUtils"

class Riff < Formula
  homepage "https://github.com/projectriff/riff"

  v = "v0.2.0" # CI Managed
  url "https://github.com/projectriff/riff/releases/download/#{v}/riff-darwin-amd64.tgz"
  version v
  sha256 "0bf537a2b8054d709895a6a7a65dd278f3e62e8c5cf25086a4792d4bbb51e7cd" # CI Managed

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

