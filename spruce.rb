require "language/go"

class Spruce < Formula
  homepage "https://github.com/geofffranks/spruce"
  url "https://github.com/geofffranks/spruce/archive/v0.13.0.tar.gz"
  sha256 "1527b045823685cb92e15f2110678d888a727dbc5b2d57b4b00940cb6d674bdb"

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
