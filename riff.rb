require "FileUtils"

class Riff < Formula
  homepage "https://github.com/projectriff/riff"

  v = "v0.1.2" # CI Managed
  url "https://github.com/projectriff/riff/releases/download/#{v}/riff-darwin-amd64.tgz"
  version v
  sha256 "b492be38a37ddc4ab9241ffe963522381cc72b49d7b6b8731edb13d3758c1a0f" # CI Managed

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

