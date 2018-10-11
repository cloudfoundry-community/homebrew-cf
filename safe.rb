require "FileUtils"

class Safe < Formula
  homepage "https://github.com/starkandwayne/safe"

  v = "v0.9.8" # CI Managed
  url "https://github.com/starkandwayne/safe/releases/download/#{v}/safe-darwin-amd64"
  version v
  sha256 "023983c36eb4ae5d0ae23a9d6b56ef8f6d41531ab577a8b292a246625d443a56" # CI Managed

  def install
    FileUtils.mv("safe-darwin-amd64", "safe")
    bin.install "safe"
  end

  test do
    system "#{bin}/safe", "--version"
  end
end
