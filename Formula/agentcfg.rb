class Agentcfg < Formula
  desc "Registry-driven config generator for opencode and omp agent harnesses"
  homepage "https://github.com/athal7/agentcfg"
  url "https://github.com/athal7/agentcfg/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "5d552fb7e7ce8cf64f1a87cf52b77c25c9ec49b802bb90490ec127f09e540556"
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
