require "fileutils"

class Genesis < Formula
  homepage "https://github.com/geofffranks/genesis"

  v = "v2.8.2" # CI Managed
  url "https://github.com/starkandwayne/genesis/releases/download/#{v}/genesis"
  version v
  sha256 "f0c7ae3bc1b164bb9b8bea0d15b15b7f69dc4b012b4c2485d62718103703f665" # CI Managed

  def install
    bin.install "genesis"
  end

  test do
    system "#{bin}/genesis", "--version"
  end
end
