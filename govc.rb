require "fileutils"

class Govc < Formula
  homepage "https://github.com/vmware/govmomi"

  v = "v0.30.1" # CI Managed
  url "https://github.com/vmware/govmomi/releases/download/#{v}/govc_Darwin_x86_64.tar.gz"
  version v
  sha256 "" # CI Managed

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

