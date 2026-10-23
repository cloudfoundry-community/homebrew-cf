class Govc < Formula
  homepage "https://github.com/vmware/govmomi"

  v = "v0.56.1" # CI Managed
  version v

  if Hardware::CPU.arm?
    url "https://github.com/vmware/govmomi/releases/download/#{v}/govc_Darwin_arm64.tar.gz"
    sha256 "3ec42dde25a14f559e95538de0aacb71a7bca983eed47bbc495f4f7d9f82e569" # CI Managed arm64
  else
    url "https://github.com/vmware/govmomi/releases/download/#{v}/govc_Darwin_x86_64.tar.gz"
    sha256 "1b7ccc4a84516a01ed2b56efb8d4aca6e33de2c4aa50b7313527e7428286eaa5" # CI Managed
  end

  def install
    bin.install "govc"
  end

  test do
    system "#{bin}/govc", "version"
  end
end
