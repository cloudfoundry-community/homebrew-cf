require "fileutils"

class Riff < Formula
  homepage "https://github.com/projectriff/riff"

  v = "v0.4.0" # CI Managed
  url "https://github.com/projectriff/riff/releases/download/#{v}/riff-darwin-amd64.tgz"
  version v
  sha256 "dc45e3cb0faaefc9483c4b6902413104f777b3a95219390535a7cee67911bd59" # CI Managed

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

