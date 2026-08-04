class OpencodeCmd < Formula
  desc "Shell CLI for the OpenCode HTTP API"
  homepage "https://github.com/athal7/opencode-cmd"
  url "https://github.com/athal7/opencode-cmd/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "5528527eed88ae86a56942073581e8796400cddb6b150866bc6e75b6a083c1f8"
  license "MIT"

  depends_on "jq"
  depends_on "xh"

  def install
    bin.install "opencode-cmd"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/opencode-cmd --help 2>&1", 1)
  end
end
