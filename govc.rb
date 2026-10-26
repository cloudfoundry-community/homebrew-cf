class Govc < Formula
  homepage "https://github.com/vmware/govmomi"

  v = "v0.56.2" # CI Managed
  version v

  if Hardware::CPU.arm?
    url "https://github.com/vmware/govmomi/releases/download/#{v}/govc_Darwin_arm64.tar.gz"
    sha256 "d5b85abf6e2d8ef602aedb35110567d58016edf5bc4ce13f25fb1a4af31957c3" # CI Managed arm64
  else
    url "https://github.com/vmware/govmomi/releases/download/#{v}/govc_Darwin_x86_64.tar.gz"
    sha256 "665233e84940a659596c84e3ce8bb79ec7e1e142f55cb696974b37db45b2a188" # CI Managed
  end

  def install
    bin.install "govc"
  end

  test do
    system "#{bin}/govc", "version"
  end
end
