require "fileutils"

class Shield < Formula
  homepage "https://github.com/starkandwayne/shield"

  v = "v9.0.0" # CI Managed
  url "https://github.com/starkandwayne/shield/releases/download/#{v}/shield-darwin-amd64"
  version v
  sha256 "db934d2a4610cb7f2c2e3a8635422656adb2eebeb7231509e1c260cd4c3a1a38" # CI Managed

  def install
    FileUtils.mv("shield-darwin-amd64", "shield")
    bin.install "shield"
  end

  test do
    system "#{bin}/shield", "-h"
  end
end

