require "FileUtils"

class Genesis < Formula
  homepage "https://github.com/geofffranks/genesis"

  v = "v1.5.6" # CI Managed
  url "https://github.com/starkandwayne/genesis/releases/download/#{v}/genesis"
  version v
  sha256 "f4ee0f8506bfb59c4ea966197be7c17b3bada318e3ea69383e0c42339f00480a" # CI Managed

  def install
    bin.install "genesis"
  end

  test do
    system "#{bin}/genesis", "--version"
  end
end
