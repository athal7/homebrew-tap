class LaunchdYaml < Formula
  desc "Declarative macOS LaunchAgent management from a YAML file"
  homepage "https://github.com/athal7/launchd-yaml"
  url "https://github.com/athal7/launchd-yaml/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "d0a5a0217e7fc6b395d54231ba78822a1607fae5423d639810703e66798ce527"
  license "MIT"

  depends_on "yq"

  def install
    bin.install "launchd-yaml"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/launchd-yaml help 2>&1")
  end
end
