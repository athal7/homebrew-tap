class Agentcfg < Formula
  desc "Registry-driven config generator for opencode and omp agent harnesses"
  homepage "https://github.com/athal7/agentcfg"
  url "https://github.com/athal7/agentcfg/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "ca6da9f4b136155f77c9425b5be171b4a2bb8d08fcb05d2ac95280fc630b5053"
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
