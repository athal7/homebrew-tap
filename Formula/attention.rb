class Attention < Formula
  desc "Prioritized triage dashboard for calendar, reminders, GitHub, and Linear"
  homepage "https://github.com/athal7/attention"
  url "https://github.com/athal7/attention/archive/refs/tags/v3.27.0.tar.gz"
  sha256 "73090716d03c6f76b3c74f400d3eebe5122f65b680e3fda35ff55f9a54a48157"
  license "MIT"

  depends_on "python@3.14"

  def install
    # `sources/` (the bundled plugins) and `dashboard.py` must live alongside
    # the `attention` script at runtime -- it resolves both relative to its
    # own resolved file path. libexec + a symlink into bin keeps that
    # relationship intact (a symlink's target still resolves correctly),
    # rather than bin.install dropping just the one file with no siblings.
    libexec.install "attention", "dashboard.py", "sources"
    # automation.py is loaded by the core from the same directory as the
    # script, so a release that ships it must have installed beside its
    # siblings. v3.25.0 does not ship it -- its core loads only dashboard.py
    # and sources/ -- so the guard keeps that tarball installable while
    # covering a later release that does.
    libexec.install "automation.py" if File.exist?("automation.py")
    bin.install_symlink libexec/"attention"
  end

  # `attention list` is a headless runner: it prints the prioritized rows and
  # exits, and the dashboard's configured session actions dispatch
  # fire-and-forget. On an interval it therefore acts as a prompt-free
  # re-assert of the user's current triage state with no terminal open.
  #
  # PATH matters more than it looks: launchd starts a service with
  # /usr/bin:/bin:/usr/sbin:/sbin, which cannot find gh, aoe, or remindctl.
  # std_service_path_env points at the Homebrew prefix; anything else goes in
  # $HOMEBREW_USER_CONFIG_HOME/services/attention.env, which Homebrew merges
  # into the plist without a formula change.
  service do
    run [opt_bin/"attention", "list"]
    run_type :interval
    interval 900
    keep_alive false
    # std_service_path_env covers the Homebrew prefix only; the
    # `attention-session` helper a session action usually calls lives
    # in the user's ~/.local/bin, so add it or every automated session
    # fails with ENOENT in the error log.
    environment_variables PATH: "#{Dir.home}/.local/bin:#{std_service_path_env}"
    # The run's stdout is the row table, including each row's encoded
    # actions: a measured 1.06 MB per tick, so ~100 MB a day at this
    # interval, for output nothing reads -- `attention` on the command line
    # already prints it on demand. Discard it and keep stderr, which is
    # where a rule that cannot dispatch a session actually reports.
    log_path "/dev/null"
    error_log_path var/"log/attention.error.log"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/attention --help")
  end
end
