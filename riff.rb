require "FileUtils"

class Riff < Formula
  homepage "https://github.com/projectriff/riff"

  v = "v0.3.0" # CI Managed
  url "https://github.com/projectriff/riff/releases/download/#{v}/riff-darwin-amd64.tgz"
  version v
  sha256 "f49049aa161237378796622877ffdc35d97efcd74a307a317a6cf30d05649063" # CI Managed

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

