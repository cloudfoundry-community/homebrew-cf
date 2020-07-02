require "fileutils"

class Safe < Formula
  homepage "https://github.com/starkandwayne/safe"

  v = "v1.5.7" # CI Managed
  url "https://github.com/starkandwayne/safe/releases/download/#{v}/safe-darwin-amd64"
  version v
  sha256 "c454fd4a31fc30a199ddfcd6693ad6cfb03c4a7988f07b36c7c3c9b36a519ac2" # CI Managed

  def install
    FileUtils.mv("safe-darwin-amd64", "safe")
    bin.install "safe"
  end

  test do
    system "#{bin}/safe", "--version"
  end
end
