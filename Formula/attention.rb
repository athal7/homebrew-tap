class Attention < Formula
  desc "Prioritized triage dashboard for calendar, reminders, GitHub, and Linear"
  homepage "https://github.com/athal7/attention"
  url "https://github.com/athal7/attention/archive/refs/tags/v3.11.2.tar.gz"
  sha256 "bcdee10281650dd8846c931a9a30b7186ceec7bb2fd5e633851af7471bf50f78"
  license "MIT"

  depends_on "python@3.14"

  def install
    # `sources/` (the bundled plugins) and `dashboard.py` must live alongside
    # the `attention` script at runtime -- it resolves both relative to its
    # own resolved file path. libexec + a symlink into bin keeps that
    # relationship intact (a symlink's target still resolves correctly),
    # rather than bin.install dropping just the one file with no siblings.
    libexec.install "attention", "dashboard.py", "sources"
    bin.install_symlink libexec/"attention"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/attention --help")
  end
end
