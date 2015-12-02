require "language/go"

class Spruce < Formula
  homepage "https://github.com/geofffranks/spruce"
  url "https://github.com/geofffranks/spruce/archive/v0.12.0.tar.gz"
  sha256 "6c57e10481b72dfdaff934595375ba03e31075283968aec073bb63419531f013"

  head "https://github.com/geofffranks/spruce.git", :branch => "master"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    mkdir_p "src/github.com/geofffranks"
    ln_s buildpath, buildpath/"src/github.com/geofffranks/spruce"

    ENV["GOPATH"] = "#{buildpath}/Godeps/_workspace:#{buildpath}"

    Language::Go.stage_deps resources, buildpath/"src"

#    system "go", "test", "github.com/geofffranks/spruce"
    system "go", "build", "-o", "spruce", "github.com/geofffranks/spruce"

    bin.install "spruce"
  end

  test do
    system "#{bin}/spruce", "--version"
  end
end
