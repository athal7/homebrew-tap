class GitWorktreeSync < Formula
desc "Auto fast-forward default branches in git worktree repos"
homepage "https://github.com/athal7/git-worktree-sync"
url "https://github.com/athal7/git-worktree-sync/archive/refs/tags/v1.1.1.tar.gz"
sha256 "34f82c363cba8affd9fede58f96d509851cd5cb852f44209074fcffa6abc7071"
license "MIT"
def install
bin.install "git-worktree-sync"
end
test do
assert_match "Hard-resets the checked-out root", shell_output("#{bin}/git-worktree-sync --help")
end
end
