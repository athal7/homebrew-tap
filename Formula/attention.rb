class Attention < Formula
  desc "Prioritized triage dashboard for calendar, reminders, GitHub, and Linear"
  homepage "https://github.com/athal7/attention"
  url "https://github.com/athal7/attention/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "97550d509ddcc54c17e2864420aaaebe76369eb2ee7802a79fa9cf4355cc9283"
  license "MIT"

  depends_on "fzf"
  depends_on "python@3.14"

  def install
    bin.install "attention"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/attention --help")
  end
end
