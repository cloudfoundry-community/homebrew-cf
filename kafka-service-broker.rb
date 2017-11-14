require "FileUtils"

class KafkaServiceBroker < Formula
  homepage "https://github.com/starkandwayne/kafka-service-broker"

  v = "v0.6.0" # CI Managed
  url "https://github.com/starkandwayne/kafka-service-broker/releases/download/#{v}/kafka-service-broker-darwin-amd64"
  version v
  sha256 "59474be06b7d0aa7b311756c19a0e7636e16ee707730fd4cbcd2454647ebc634" # CI Managed

  def install
    FileUtils.mv("kafka-service-broker-darwin-amd64", "eden")
    bin.install "kafka-service-broker"
  end

  test do
    system "#{bin}/kafka-service-broker", "-v"
  end
end
