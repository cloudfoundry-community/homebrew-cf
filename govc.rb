class Govc < Formula
  homepage "https://github.com/vmware/govmomi"

  v = "v0.56.0" # CI Managed
  version v

  if Hardware::CPU.arm?
    url "https://github.com/vmware/govmomi/releases/download/#{v}/govc_Darwin_arm64.tar.gz"
    sha256 "559430d7691c98172b6b137337cb99c8e0c822512e0ddd170f19bea63cc95e15" # CI Managed arm64
  else
    url "https://github.com/vmware/govmomi/releases/download/#{v}/govc_Darwin_x86_64.tar.gz"
    sha256 "0c0b1bace57542574584d4e76d097fb81d003c07380469d96bacc1f8eb640042" # CI Managed
  end

  def install
    bin.install "govc"
  end

  test do
    system "#{bin}/govc", "version"
  end
end
