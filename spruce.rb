require "language/go"

class Spruce < Formula
  homepage "https://github.com/geofffranks/spruce"
  url "https://github.com/geofffranks/spruce/archive/v1.0.3.tar.gz"
  sha256 "567e41e0fae659c72c382b846ad3073a30b1386a3a256c864983a826cb4c7485"

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
