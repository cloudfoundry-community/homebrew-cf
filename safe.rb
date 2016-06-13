require "FileUtils"

class Safe < Formula
  homepage "https://github.com/jhunt/safe"

  v = "v0.0.14" # CI Managed
  url "https://github.com/jhunt/safe/releases/download/#{v}/safe-darwin-amd64"
  version v
  sha256 "75b7687e6d05a4558935a2b28225d70382fe96fd51657a56f494a523c8cf6d5c" # CI Managed

  def install
    FileUtils.mv("safe-darwin-amd64", "safe")
    bin.install "safe"
  end

  test do
    system "#{bin}/safe", "--version"
  end
end
