require "FileUtils"

class Riff < Formula
  homepage "https://github.com/projectriff/riff"

  v = "v0.1.3" # CI Managed
  url "https://github.com/projectriff/riff/releases/download/#{v}/riff-darwin-amd64.tgz"
  version v
  sha256 "d312e4775fba42f75ad0a876d143dc3e665ff946eb5d8c9a51d01db2cf542304" # CI Managed

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

