require "FileUtils"

class Eden < Formula
  homepage "https://github.com/starkandwayne/eden"

  v = "v0.7.0" # CI Managed
  url "https://github.com/starkandwayne/eden/releases/download/#{v}/eden-darwin-amd64"
  version v
  sha256 "05c1718cd7154514e5e8dc8814e9d609b0d235e4d894610a5384b607905c3e42" # CI Managed

  def install
    FileUtils.mv("eden-darwin-amd64", "eden")
    bin.install "eden"
  end

  test do
    system "#{bin}/eden", "--version"
  end
end
