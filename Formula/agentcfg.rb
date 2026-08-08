class Agentcfg < Formula
  desc "Registry-driven config generator for opencode and omp agent harnesses"
  homepage "https://github.com/athal7/agentcfg"
  url "https://github.com/athal7/agentcfg/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8d6b9ab730377002e69dc3d5b38f138d5bc8f4d8e575ece3720494951b77c322"
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
