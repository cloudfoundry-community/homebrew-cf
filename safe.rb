require "fileutils"

class Safe < Formula
  homepage "https://github.com/cloudfoundry-community/safe"

  v = "v1.26.2" # CI Managed
  @@verNum = v.sub "v", ""
  version v

  if Hardware::CPU.arm?
    url "https://github.com/cloudfoundry-community/safe/releases/download/#{v}/safe-#{@@verNum}-darwin-arm64"
    sha256 "fd761cab4bbdb5b33345fa68d42a7e8c200d34d12c568d8134958e796fb7339b" # CI Managed arm64
  else
    url "https://github.com/cloudfoundry-community/safe/releases/download/#{v}/safe-#{@@verNum}-darwin-amd64"
    sha256 "febb40df4ac9354b4a3878ddc5863f5a9d795d7acff2557d786f6825b052e129" # CI Managed
  end

  def install
    FileUtils.mv(Dir["safe-#{@@verNum}-darwin-*"].first, "safe")
    bin.install "safe"
  end

  test do
    system "#{bin}/safe", "--version"
  end
end
