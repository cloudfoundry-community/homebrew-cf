require "fileutils"

class Govc < Formula
  homepage "https://github.com/vmware/govmomi"

  v = "v0.22.0" # CI Managed
  url "https://github.com/vmware/govmomi/releases/download/#{v}/govc_darwin_amd64.gz"
  version v
  sha256 "a98a92390fd5bcccbc692f7395f8543af24fd9828348093bbd598aeb3c8cdac6" # CI Managed

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

