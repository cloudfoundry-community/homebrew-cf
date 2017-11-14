require "FileUtils"

class KafkaServiceBroker < Formula
  homepage "https://github.com/starkandwayne/kafka-service-broker"

  v = "v2.0.1" # CI Managed
  url "https://github.com/starkandwayne/kafka-service-broker/releases/download/#{v}/kafka-service-broker-darwin-amd64"
  version v
  sha256 "ed65a26af598a9ef5d866dc941962d95732a2282573a815478303c1cb6c7cf4c" # CI Managed

  def install
    FileUtils.mv("kafka-service-broker-darwin-amd64", "kafka-service-broker")
    bin.install "kafka-service-broker"
  end

  test do
    system "#{bin}/kafka-service-broker", "-v"
  end
end
