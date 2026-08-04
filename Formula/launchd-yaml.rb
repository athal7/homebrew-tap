class LaunchdYaml < Formula
  desc "Declarative macOS LaunchAgent management from a YAML file"
  homepage "https://github.com/athal7/launchd-yaml"
  url "https://github.com/athal7/launchd-yaml/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "1c0f2a840e7115eb9bcc7eafc1924cfdd5a1e74ba525c5ad2bf113a8a18f8b2d"
  license "MIT"

  depends_on "yq"

  def install
    bin.install "launchd-yaml"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/launchd-yaml help 2>&1")
  end
end
