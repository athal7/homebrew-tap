class Attention < Formula
  desc "Prioritized triage dashboard for calendar, reminders, GitHub, and Linear"
  homepage "https://github.com/athal7/attention"
  url "https://github.com/athal7/attention/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "434e3a0c8d22b118bd647567b5a0b7bb053bf588f79811f088aaa88a9ba505dc"
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
