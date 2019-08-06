require "fileutils"

class KafkaServiceBroker < Formula
  homepage "https://github.com/starkandwayne/kafka-service-broker"

  v = "v2.1.0" # CI Managed
  url "https://github.com/starkandwayne/kafka-service-broker/releases/download/#{v}/kafka-service-broker-darwin-amd64"
  version v
  sha256 "6f38f1d145b24ea0a9f92e5c21ead9586610f951ac519e940fd0d821d1c82511" # CI Managed

  def install
    FileUtils.mv("kafka-service-broker-darwin-amd64", "kafka-service-broker")
    bin.install "kafka-service-broker"
  end

  test do
    system "#{bin}/kafka-service-broker", "-v"
  end
end
