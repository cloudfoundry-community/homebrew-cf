require "FileUtils"

class Genesis < Formula
  homepage "https://github.com/geofffranks/genesis"

  v = "v2.6.10" # CI Managed
  url "https://github.com/starkandwayne/genesis/releases/download/#{v}/genesis"
  version v
  sha256 "197e87b2d7f8ec3fc582d78d40535d818d8d120866139d0ae7fecdb365cac9c3" # CI Managed

  def install
    bin.install "genesis"
  end

  test do
    system "#{bin}/genesis", "--version"
  end
end
