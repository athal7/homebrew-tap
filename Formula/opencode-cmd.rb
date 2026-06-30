class OpencodeCmd < Formula
  desc "Shell CLI for the OpenCode HTTP API"
  homepage "https://github.com/athal7/opencode-cmd"
  url "https://github.com/athal7/opencode-cmd/releases/download/v1.0.0/opencode-cmd"
  sha256 "53a94f8e4a1c32a0532f3f8b949bbbd4ccf8db5d5ec569c229d8f55f9e976756"
  license "MIT"
  version "1.0.0"

  depends_on "jq"
  depends_on "xh"

  def install
    bin.install "opencode-cmd"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/opencode-cmd --help 2>&1", 1)
  end
end
