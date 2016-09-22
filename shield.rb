require "FileUtils"

class Shield < Formula
  homepage "https://github.com/starkandwayne/shield"

  v = "v0.6.6" # CI Managed
  url "https://github.com/starkandwayne/shield/releases/download/#{v}/shield-darwin-amd64"
  version v
  sha256 "36bc43ccda74cc172b297b37891d377ca4ddbfb02958969c02bc7d81af28620c" # CI Managed

  def install
    FileUtils.mv("shield-darwin-amd64", "shield")
    bin.install "shield"
  end

  test do
    system "#{bin}/shield", "-h"
  end
end

