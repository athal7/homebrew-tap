class OpencodeCmd < Formula
  desc "Shell CLI for the OpenCode HTTP API"
  homepage "https://github.com/athal7/opencode-cmd"
  url "https://github.com/athal7/opencode-cmd/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "0daf8ccdfb0d23ff78ff3703a1b5f8412fbd428fd1df510d91d23f9382764f31"
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
