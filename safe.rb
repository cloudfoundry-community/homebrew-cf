require "FileUtils"

class Safe < Formula
  homepage "https://github.com/starkandwayne/safe"

  v = "v1.0.1" # CI Managed
  url "https://github.com/starkandwayne/safe/releases/download/#{v}/safe-darwin-amd64"
  version v
  sha256 "a82c9db4ee71d13c673d7df2d77203fde75a899156b5d293943bfa0a4b129717" # CI Managed

  def install
    FileUtils.mv("safe-darwin-amd64", "safe")
    bin.install "safe"
  end

  test do
    system "#{bin}/safe", "--version"
  end
end
