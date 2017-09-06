require "FileUtils"

class Eden < Formula
  homepage "https://github.com/starkandwayne/eden"

  v = "v0.5.0" # CI Managed
  url "https://github.com/starkandwayne/eden/releases/download/#{v}/eden-darwin-amd64"
  version v
  sha256 "83ef00c746fbfeec10698b60857721955eec6a0adefcb82cbdc1e639ecae97e1" # CI Managed

  def install
    FileUtils.mv("eden-darwin-amd64", "eden")
    bin.install "eden"
  end

  test do
    system "#{bin}/eden", "--version"
  end
end
