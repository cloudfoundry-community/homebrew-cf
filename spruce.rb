require "formula"

class Spruce < Formula
  homepage "https://github.com/geofffranks/spruce"
  url "https://github.com/geofffranks/spruce.git", :tag => "v0.9.0"

  head "https://github.com/geofffranks/spruce.git", :branch => "master"

  depends_on "go" => :build
  depends_on "godep" => :build

  def install
    ENV["GOPATH"] = buildpath

    mkdir_p "src/github.com/geofffranks/spruce"
    ln_s buildpath, buildpath/"src/github.com/geofffranks/spruce

    ENV["GOPATH"] = "#{buildpath}/Godeps/_workspace:#{buildpath}""

    system "godep", "go", "test", "github.com/geofffranks/spruce"
    system "godep", "go", "build", "-o", "spruce", "github.com/geofffranks/spruce"

    bin.install "spruce"
  end

  test do
    system "#{bin}/spruce", "--version"
  end
end
