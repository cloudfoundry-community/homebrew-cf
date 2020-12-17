require "fileutils"

class Genesis < Formula
  homepage "https://github.com/geofffranks/genesis"

  v = "v2.7.26" # CI Managed
  url "https://github.com/starkandwayne/genesis/releases/download/#{v}/genesis"
  version v
  sha256 "605478f80143d27ad2e2c0d41bf315c74eb034e4758c00390b89f52d4d7eb2a7" # CI Managed

  def install
    bin.install "genesis"
  end

  test do
    system "#{bin}/genesis", "--version"
  end
end
