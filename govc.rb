require "fileutils"

class Govc < Formula
  homepage "https://github.com/vmware/govmomi"

  v = "v0.21.0" # CI Managed
  url "https://github.com/vmware/govmomi/releases/download/#{v}/govc_darwin_amd64.gz"
  version v
  sha256 "bd7c2879b287baf4fad71852bbef5945081048cce8b12b4f10e95a1393018415" # CI Managed

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

