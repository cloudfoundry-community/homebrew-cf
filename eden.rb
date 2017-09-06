require "FileUtils"

class Eden < Formula
  homepage "https://github.com/starkandwayne/safe"

  v = "v0.5.0" # CI Managed
  url "https://github.com/starkandwayne/safe/releases/download/#{v}/safe-darwin-amd64"
  version v
  sha256 "83ef00c746fbfeec10698b60857721955eec6a0adefcb82cbdc1e639ecae97e1" # CI Managed

  def install
    FileUtils.mv("eden-darwin-amd64", "safe")
    bin.install "eden"
  end

  test do
    system "#{bin}/eden", "--version"
  end
end
