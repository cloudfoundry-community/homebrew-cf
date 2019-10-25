require "fileutils"

class Eden < Formula
  homepage "https://github.com/starkandwayne/eden"

  v = "v0.7.4" # CI Managed
  url "https://github.com/starkandwayne/eden/releases/download/#{v}/eden-darwin-amd64"
  version v
  sha256 "78bc2e2fa6bca9db9f96f18d6615bf6000dda169935dd8bbcf25471e15642af0" # CI Managed

  def install
    FileUtils.mv("eden-darwin-amd64", "eden")
    bin.install "eden"
  end

  test do
    system "#{bin}/eden", "--version"
  end
end
