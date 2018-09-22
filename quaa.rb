class Quaa < Formula
  desc "Quickly run Cloud Foundry UAA inside Apache Tomcat"
  homepage "https://github.com/starkandwayne/quick-uaa-local"

  v = "v1.0.4" # CI Managed
  url "https://github.com/starkandwayne/quick-uaa-local/archive/#{v}.tar.gz"
  version v
  sha256 "496cff79ae37f3e6904591d019427fb5f460acc8ad6f61a1cb57a08c5849ca4c" # CI Managed

  devel do
    url "https://github.com/starkandwayne/quick-uaa-local.git", using: :git
  end


  depends_on java: "1.8"
  depends_on "cloudfoundry/tap/bosh-cli" => "5.2.2"
  depends_on "starkandwayne/cf/uaa-cli" => "0.0.1"

  def install
    bosh_bin = File.join(Formula["cloudfoundry/tap/bosh-cli"].opt_bin, "bosh")
    uaa_bin  = File.join(Formula["starkandwayne/cf/uaa-cli"].opt_bin, "uaa")

    (share/"manifests").install Dir["*", ".versions"]

    quaa = <<-SHELL
#!/bin/bash

export BOSH_BIN=#{bosh_bin}
export UAA_BIN=#{uaa_bin}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

#{(share/"manifests/bin/quaa")} "$@"
SHELL
    bin.mkpath
    (bin/"quaa").binwrite(quaa)

    puts <<-README

    To run an in-memory UAA:

        quaa up

    To run the UAA backed by your local existing PostgreSQL database:

        quaa up --postgresql

    The UAA will be running at http://localhost:8080

    In another terminal, you can target & authorize the new "uaa" CLI:

        quaa auth-client

    Example "uaa" commands to try:

        uaa clients
        uaa users
        uss groups

    README
  end

  plist_options :manual => "quaa up"

  def _plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Disabled</key>
        <false/>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{opt_bin}/quaa</string>
          <string>up</string>
        </array>
        <key>KeepAlive</key>
        <true/>
        <key>StandardOutPath</key>
        <string>#{libexec}/logs/launchd.out.log</string>
        <key>StandardErrorPath</key>
        <string>#{libexec}/logs/launchd.err.log</string>
      </dict>
    </plist>
  EOS
  end

  test do
    ENV["CATALINA_BASE"] = testpath
    cp_r Dir["#{libexec}/*"], testpath
    rm Dir["#{libexec}/logs/*"]

    pid = fork do
      exec bin/"uaa-catalina", "start"
    end
    sleep 3
    begin
      system bin/"uaa-catalina", "stop"
    ensure
      Process.wait pid
    end
    assert_predicate testpath/"logs/catalina.out", :exist?
  end
end
