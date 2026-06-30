class GitWorktreeSync < Formula
  desc "Auto fast-forward default branches in git worktree repos"
  homepage "https://github.com/athal7/git-worktree-sync"
  url "https://github.com/athal7/git-worktree-sync/releases/download/v1.0.0/git-worktree-sync"
  sha256 "8014280073ed0a8336bacefece1b4615cce7cfd4fc3e49eec529a4353ce6d78b"
  license "MIT"
  version "1.0.0"

  def install
    bin.install "git-worktree-sync"
  end

  test do
    assert_match "usage", shell_output("#{bin}/git-worktree-sync --help 2>&1", 1)
  end
end
