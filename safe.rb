require "FileUtils"

class Safe < Formula
  homepage "https://github.com/jhunt/safe"

  v = "v0.0.17" # CI Managed
  url "https://github.com/jhunt/safe/releases/download/#{v}/safe-darwin-amd64"
  version v
  sha256 "a638d4ad76448168d235f38df679a9dcd2e845c35859b9d8ee2a80b827382d40" # CI Managed

  def install
    FileUtils.mv("safe-darwin-amd64", "safe")
    bin.install "safe"
  end

  test do
    system "#{bin}/safe", "--version"
  end
end
