require "FileUtils"

class Eden < Formula
  homepage "https://github.com/starkandwayne/eden"

  v = "v0.6.3" # CI Managed
  url "https://github.com/starkandwayne/eden/releases/download/#{v}/eden-darwin-amd64"
  version v
  sha256 "c540424e9cbb22054c7e543f36ff0eea2159af3d04b860e0521092079e52abf9" # CI Managed

  def install
    FileUtils.mv("eden-darwin-amd64", "eden")
    bin.install "eden"
  end

  test do
    system "#{bin}/eden", "--version"
  end
end
