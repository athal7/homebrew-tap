class GitWorktreeSync < Formula
  desc "Auto fast-forward default branches in git worktree repos"
  homepage "https://github.com/athal7/git-worktree-sync"
  url "https://github.com/athal7/git-worktree-sync/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "d9da45cfe4d0ad4721d9415ba4e8175a74156d8e75b64f042656f89084492a83"
  license "MIT"

  def install
    bin.install "git-worktree-sync"
  end

  test do
    assert_match "usage", shell_output("#{bin}/git-worktree-sync --help 2>&1", 1)
  end
end
