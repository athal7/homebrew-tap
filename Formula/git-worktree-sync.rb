class GitWorktreeSync < Formula
  desc "Auto fast-forward default branches in git worktree repos"
  homepage "https://github.com/athal7/git-worktree-sync"
  url "https://github.com/athal7/git-worktree-sync/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "415c32a0241976646acf248788edb9c47f4796f18b4f746fe42890f92142c76a"
  license "MIT"

  def install
    bin.install "git-worktree-sync"
  end

  test do
    assert_match "usage", shell_output("#{bin}/git-worktree-sync --help 2>&1", 1)
  end
end
