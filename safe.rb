require "fileutils"

class Safe < Formula
  homepage "https://github.com/starkandwayne/safe"

  v = "v1.5.0" # CI Managed
  url "https://github.com/starkandwayne/safe/releases/download/#{v}/safe-darwin-amd64"
  version v
  sha256 "76bfbb54fb23dcb62f062eb0e6bfc6d4cd5b6f1d69b4faa10780b511649bc983" # CI Managed

  def install
    FileUtils.mv("safe-darwin-amd64", "safe")
    bin.install "safe"
  end

  test do
    system "#{bin}/safe", "--version"
  end
end
