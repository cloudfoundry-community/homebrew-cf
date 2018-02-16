require "FileUtils"

class Genesis < Formula
  homepage "https://github.com/geofffranks/genesis"

  v = "v2.5.1" # CI Managed
  url "https://github.com/starkandwayne/genesis/releases/download/#{v}/genesis"
  version v
  sha256 "b37c5ebabe680f715cb9deb0f8068ca2aea3876d458d55e8dd8e1d3aab6f6d62" # CI Managed

  def install
    bin.install "genesis"
  end

  test do
    system "#{bin}/genesis", "--version"
  end
end
