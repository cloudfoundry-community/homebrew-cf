require "fileutils"

class Genesis < Formula
  homepage "https://github.com/geofffranks/genesis"

  v = "v2.7.2" # CI Managed
  url "https://github.com/starkandwayne/genesis/releases/download/#{v}/genesis"
  version v
  sha256 "499a6f2e2f95e981631f31a61571caab204ee762d62d263b39b15d2096260bce" # CI Managed

  def install
    bin.install "genesis"
  end

  test do
    system "#{bin}/genesis", "--version"
  end
end
