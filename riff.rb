require "FileUtils"

class Riff < Formula
  homepage "https://github.com/projectriff/riff"

  v = "v0.1.1" # CI Managed
  url "https://github.com/projectriff/riff/releases/download/#{v}/riff-darwin-amd64.tgz"
  version v
  sha256 "04e35c54bccc2471740f8cd840e77b7a361a8c69cd419782cde0271f3dcbfad4" # CI Managed

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

