class LaunchdYaml < Formula
  desc "Declarative macOS LaunchAgent management from a YAML file"
  homepage "https://github.com/athal7/launchd-yaml"
  url "https://github.com/athal7/launchd-yaml/releases/download/v1.0.0/launchd-yaml"
  sha256 "8cd9d35cda1f4c333896c066ac124de5e6f1e2b9a68a5e196bc9f3f6580f0902"
  license "MIT"
  version "1.0.0"

  depends_on "yq"

  def install
    bin.install "launchd-yaml"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/launchd-yaml help 2>&1")
  end
end
