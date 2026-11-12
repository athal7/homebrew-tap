class Attention < Formula
  desc "Prioritized triage dashboard for calendar, reminders, GitHub, and Linear"
  homepage "https://github.com/athal7/attention"
  url "https://github.com/athal7/attention/archive/refs/tags/v3.26.0.tar.gz"
  sha256 "517dab79ba5a191ce8b811fdb5721af7e4f17ff21e9448b137d2a4e46d2a39c0"
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
    environment_variables PATH: std_service_path_env
    log_path var/"log/attention.log"
    error_log_path var/"log/attention.error.log"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/attention --help")
  end
end
