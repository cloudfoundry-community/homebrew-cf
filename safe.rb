require "FileUtils"

class Safe < Formula
  homepage "https://github.com/starkandwayne/safe"

  v = "v0.0.26" # CI Managed
  url "https://github.com/starkandwayne/safe/releases/download/#{v}/safe-darwin-amd64"
  version v
  sha256 "a7b9fc8046d6ddfea71793e1b92074e43d8aed6e1308ebedb82259595e3cb22b" # CI Managed

  def install
    FileUtils.mv("safe-darwin-amd64", "safe")
    bin.install "safe"
  end

  test do
    system "#{bin}/safe", "--version"
  end
end
