class Attention < Formula
  desc "Prioritized triage dashboard for calendar, reminders, GitHub, and Linear"
  homepage "https://github.com/athal7/attention"
  url "https://github.com/athal7/attention/archive/refs/tags/v3.23.4.tar.gz"
  sha256 "b0f3979502181b8f790496aa921f0a1d2612297f3ca84915e1eb73b329c96c22"
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
