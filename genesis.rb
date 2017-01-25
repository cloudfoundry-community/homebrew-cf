require "FileUtils"

class Genesis < Formula
  homepage "https://github.com/geofffranks/genesis"

  v = "v1.7.3" # CI Managed
  url "https://github.com/starkandwayne/genesis/releases/download/#{v}/genesis"
  version v
  sha256 "b6e8fe879dc695538b1d5303f2132e19941e47ddb4a5fcff091a4de10f7e2bf2" # CI Managed

  def install
    bin.install "genesis"
  end

  test do
    system "#{bin}/genesis", "--version"
  end
end
