require "FileUtils"

class Genesis < Formula
  homepage "https://github.com/geofffranks/genesis"

  v = "v1.7.8" # CI Managed
  url "https://github.com/starkandwayne/genesis/releases/download/#{v}/genesis"
  version v
  sha256 "e5cc133c99f9134aa1b34d5129f4706f13eb4c94340c8b793e931857c98e10a7" # CI Managed

  def install
    bin.install "genesis"
  end

  test do
    system "#{bin}/genesis", "--version"
  end
end
