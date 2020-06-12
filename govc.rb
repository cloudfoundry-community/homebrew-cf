require "fileutils"

class Govc < Formula
  homepage "https://github.com/vmware/govmomi"

  v = "v0.23.0" # CI Managed
  url "https://github.com/vmware/govmomi/releases/download/#{v}/govc_darwin_amd64.gz"
  version v
  sha256 "bae85b6c648b4da6b1cefe6133112682b8dd32f6fa980695043caaeb977ce07f" # CI Managed

  def gunzip(filename)
    command = "gunzip --force #{filename}"
    success = system(command)

    success && $?.exitstatus == 0
  end

  def install
    FileUtils.mv("govc_darwin_amd64", "govc")
    bin.install "govc"
  end

  test do
    system "#{bin}/govc", "version"
  end
end

