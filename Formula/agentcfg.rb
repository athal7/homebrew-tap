class Agentcfg < Formula
  desc "Registry-driven config generator for opencode and omp agent harnesses"
  homepage "https://github.com/athal7/agentcfg"
  url "https://github.com/athal7/agentcfg/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "7fbdc2527e77ebfe667e942bb91376a82d0239d35a10bdcdf5b50eedb3ea08a5"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/athal7/agentcfg/internal/cli.version=v#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/agentcfg"
  end

  test do
    assert_match "agentcfg", shell_output("#{bin}/agentcfg --version")
  end
end
