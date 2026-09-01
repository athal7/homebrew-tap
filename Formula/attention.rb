class Attention < Formula
  desc "Prioritized triage dashboard for calendar, reminders, GitHub, and Linear"
  homepage "https://github.com/athal7/attention"
  url "https://github.com/athal7/attention/archive/refs/tags/v3.3.0.tar.gz"
  sha256 "81b54e29f6bda27bf4a3b94d95b9aeb5be63eeba5c838c55c4c90d935165a45f"
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
