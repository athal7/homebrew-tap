class Attention < Formula
  desc "Prioritized triage dashboard for calendar, reminders, GitHub, and Linear"
  homepage "https://github.com/athal7/attention"
  url "https://github.com/athal7/attention/archive/refs/tags/v2.1.1.tar.gz"
  sha256 "d921ce64d2552a653eae76ab2fcf6dffcf8615ec0b2163b2ecb869214085952b"
  license "MIT"

  depends_on "fzf"
  depends_on "python@3.14"

  def install
    # `sources/` (the bundled plugins) must live alongside the `attention`
    # script at runtime -- it resolves plugins relative to its own resolved
    # file path. libexec + a symlink into bin keeps that relationship intact
    # (a symlink's target still resolves correctly), rather than bin.install
    # dropping just the one file with no sibling directory.
    libexec.install "attention", "sources"
    bin.install_symlink libexec/"attention"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/attention --help")
  end
end
