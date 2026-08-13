class LaunchdYaml < Formula
  desc "Declarative macOS LaunchAgent management from a YAML file"
  homepage "https://github.com/athal7/launchd-yaml"
  url "https://github.com/athal7/launchd-yaml/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "927b6ad3ac7144164c50a417c6ef5ef80c16a103b7a844503e91602b83a80416"
  license "MIT"

  depends_on "yq"

  def install
    bin.install "launchd-yaml"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/launchd-yaml help 2>&1")
  end
end
