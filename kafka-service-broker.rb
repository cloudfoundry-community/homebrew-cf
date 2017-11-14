require "FileUtils"

class KafkaServiceBroker < Formula
  homepage "https://github.com/starkandwayne/kafka-service-broker"

  v = "v2.0.0" # CI Managed
  url "https://github.com/starkandwayne/kafka-service-broker/releases/download/#{v}/kafka-service-broker-darwin-amd64"
  version v
  sha256 "f313e4cf8556e20f0faf24db1b53c557a14a1a1a2b998cd0a5d2e0a1d706a7e4" # CI Managed

  def install
    FileUtils.mv("kafka-service-broker-darwin-amd64", "kafka-service-broker")
    bin.install "kafka-service-broker"
  end

  test do
    system "#{bin}/kafka-service-broker", "-v"
  end
end
