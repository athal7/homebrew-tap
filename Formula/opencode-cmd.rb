class OpencodeCmd < Formula
  desc "Shell CLI for the OpenCode HTTP API"
  homepage "https://github.com/athal7/opencode-cmd"
  url "https://github.com/athal7/opencode-cmd/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "1b0261a5011f2b5ffa4fb732a68a2bb79d1558dcb29cec274b5b7dbff5fc9ec6"
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
