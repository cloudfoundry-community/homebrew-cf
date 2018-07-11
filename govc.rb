require "FileUtils"

class Govc < Formula
  homepage "https://github.com/vmware/govmomi"

  v = "v0.18.0" # CI Managed
  url "https://github.com/vmware/govmomi/releases/download/#{v}/govc_darwin_amd64.gz"
  version v
  sha256 "58d522f32e79c509f4b42edb7d0e80ef0bade5592520df06b93c8f91731e780a" # CI Managed

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

