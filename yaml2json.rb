require "language/go"

class Yaml2json < Formula
  homepage "https://github.com/bronze1man/yaml2json"
  url "https://github.com/bronze1man/yaml2json/archive/c51c79.zip"
  sha256 "6c701cb9035547f7c5453c8904ea9942dc9cde6a1b484f06655d1ae49187b9f9"

  version '0.0.1'

  head "https://github.com/bronze1man/yaml2json", :branch => "master"

  def install
    ENV["GOPATH"] = buildpath

    mkdir_p "src/github.com/bronze1man"
    ln_s buildpath, buildpath/"src/github.com/bronze1man/yaml2json"

    ENV["GOPATH"] = "#{buildpath}/Godeps/_workspace:#{buildpath}"

    Language::Go.stage_deps resources, buildpath/"src"

#    system "go", "test", "github.com/geofffranks/spruce"
    system "go", "build", "-o", "yaml2json", "github.com/bronze1man/yaml2json"

    bin.install "yaml2json"
  end

  test do
    system "echo '- first' | #{bin}/yaml2json"
  end
end
