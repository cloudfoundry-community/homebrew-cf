require "language/go"

class Spruce < Formula
  homepage "https://github.com/geofffranks/spruce"
  url "https://github.com/geofffranks/spruce/archive/v1.0.1.tar.gz"
  sha256 "9dcde303012ffdbaa25406620244997ddc2c89e3a14188bc7e9ef926905d8ff5"

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
