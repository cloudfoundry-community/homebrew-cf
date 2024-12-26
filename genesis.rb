require "fileutils"

class Genesis < Formula
  homepage "https://github.com/geofffranks/genesis"

  v = "v3.0.12" # CI Managed
  url "https://github.com/starkandwayne/genesis/releases/download/#{v}/genesis"
  version v
  sha256 "2b58f66595f9fb7a9016014180113d13a4cd00031d151938ffe8ccdc2b4d4018" # CI Managed

  def install
    bin.install "genesis"
  end

  test do
    system "#{bin}/genesis", "--version"
  end
end
