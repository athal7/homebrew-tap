class Agentcfg < Formula
  desc "Registry-driven config generator for opencode and omp agent harnesses"
  homepage "https://github.com/athal7/agentcfg"
  url "https://github.com/athal7/agentcfg/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "cf33f2de40699a69ff37d35338a4e1a2cd9da87b3430a2da47934791f846684c"
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
