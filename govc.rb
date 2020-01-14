require "fileutils"

class Govc < Formula
  homepage "https://github.com/vmware/govmomi"

  v = "v0.22.1" # CI Managed
  url "https://github.com/vmware/govmomi/releases/download/#{v}/govc_darwin_amd64.gz"
  version v
  sha256 "0d2eb69893fa62d0281f02a39f467841fe7dcf43b060e37ec96338d36f1039cd" # CI Managed

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

