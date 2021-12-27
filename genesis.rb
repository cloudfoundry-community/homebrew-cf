require "fileutils"

class Genesis < Formula
  homepage "https://github.com/geofffranks/genesis"

  v = "v2.8.4" # CI Managed
  url "https://github.com/starkandwayne/genesis/releases/download/#{v}/genesis"
  version v
  sha256 "bd5b103bf4756ef2aec9765666865e5496d4afdd1a890ba2cfc47b3a4c1b488f" # CI Managed

  def install
    bin.install "genesis"
  end

  test do
    system "#{bin}/genesis", "--version"
  end
end
