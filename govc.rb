require "FileUtils"

class Govc < Formula
  homepage "https://github.com/vmware/govmomi"

  v = "v0.19.0" # CI Managed
  url "https://github.com/vmware/govmomi/releases/download/#{v}/govc_darwin_amd64.gz"
  version v
  sha256 "9b67f43580cdd731ff1b963e6767248e8bbdb523c29fb97d54210574ff6e085a" # CI Managed

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

