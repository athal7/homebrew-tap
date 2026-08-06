class Attention < Formula
  desc "Prioritized triage dashboard for calendar, reminders, GitHub, and Linear"
  homepage "https://github.com/athal7/attention"
  url "https://github.com/athal7/attention/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "5be7ef2542baecb21654d13b912c3ea69cc9a2d10036d4b705b7c7be9e744ada"
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
