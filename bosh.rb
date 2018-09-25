require "FileUtils"

class Bosh < Formula
  homepage "https://github.com/cloudfoundry/bosh-cli"

  v = "v5.3.1" # CI Managed
  # remove v from version number
  @@verNum = v.sub "v", ""
  url "https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-#{@@verNum}-darwin-amd64"
  version v
  sha256 "340d09723eacc0c9611fbdb5c60c2cfebe9a1fd3d3f9b12dd69161a6a4d865e8" # CI Managed

  def install
    FileUtils.mv("bosh-cli-#{@@verNum}-darwin-amd64", "bosh")
    bin.install "bosh"
  end

  test do
    system "#{bin}/bosh", "--version"
  end
end
