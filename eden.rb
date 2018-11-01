require "FileUtils"

class Eden < Formula
  homepage "https://github.com/starkandwayne/eden"

  v = "v0.7.1" # CI Managed
  url "https://github.com/starkandwayne/eden/releases/download/#{v}/eden-darwin-amd64"
  version v
  sha256 "3c77b121f3ac886a3f4647c58edef74d803a840e2c02f4c249d82bbfc6f465f4" # CI Managed

  def install
    FileUtils.mv("eden-darwin-amd64", "eden")
    bin.install "eden"
  end

  test do
    system "#{bin}/eden", "--version"
  end
end
