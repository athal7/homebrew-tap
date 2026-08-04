class GitWorktreeSync < Formula
  desc "Auto fast-forward default branches in git worktree repos"
  homepage "https://github.com/athal7/git-worktree-sync"
  url "https://github.com/athal7/git-worktree-sync/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "cf355ed3657502edcf02dc84ef54e6dbb1dfb4f69e4e75b60227089b6babe779"
  license "MIT"

  def install
    bin.install "git-worktree-sync"
  end

  test do
    assert_match "usage", shell_output("#{bin}/git-worktree-sync --help 2>&1", 1)
  end
end
