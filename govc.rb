require "FileUtils"

class Govc < Formula
  homepage "https://github.com/vmware/govmomi"

  v = "v0.20.0" # CI Managed
  url "https://github.com/vmware/govmomi/releases/download/#{v}/govc_darwin_amd64.gz"
  version v
  sha256 "658be95b5e22952a5119c73c625ad5478069c72ee59f140a2c80f97a8c42a44f" # CI Managed

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

