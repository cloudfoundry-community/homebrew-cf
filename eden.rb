require "fileutils"

class Eden < Formula
  homepage "https://github.com/starkandwayne/eden"

  v = "v0.7.3" # CI Managed
  url "https://github.com/starkandwayne/eden/releases/download/#{v}/eden-darwin-amd64"
  version v
  sha256 "83bafee201f1fba80aad174a731a7528d331f5dee68c80d45d42d18510d29162" # CI Managed

  def install
    FileUtils.mv("eden-darwin-amd64", "eden")
    bin.install "eden"
  end

  test do
    system "#{bin}/eden", "--version"
  end
end
