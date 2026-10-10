class CalAutomation < Formula
  include Language::Python::Virtualenv

  desc "Calendar automations backed by ical and XDG configuration"
  homepage "https://github.com/athal7/cal"
  url "https://github.com/athal7/cal/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "c120b9af80d50eaef5b04bd2e51520051986dd8d5ba89aa962d7b95506961595"
  license "MIT"

  depends_on "python@3.14"

  resource "icalendar" do
    url "https://files.pythonhosted.org/packages/47/2b/1bbf82d316df18c3331d9a06228819c8a5814ceda545a3e9980e52ffce1b/icalendar-7.3.0.tar.gz"
    sha256 "7bd001c8e648205e1bde5c6a5b77096598e8d0893dcf57755c6c597635620132"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/66/c0/0c8b6ad9f17a802ee498c46e004a0eb49bc148f2fd230864601a86dcf6db/python-dateutil-2.9.0.post0.tar.gz"
    sha256 "37dd54208da7e1cd875388217d5e00ebd4179249f90fb72437e91a35459a0ad3"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/94/e7/b2c673351809dca68a0e064b6af791aa332cf192da575fd474ed7d6f16a2/six-1.17.0.tar.gz"
    sha256 "ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81"
  end

  resource "tzdata" do
    url "https://files.pythonhosted.org/packages/d9/68/f1b440335057bfce71b6e50a9d09445aa2ecbd08359a337976627b8409e7/tzdata-2026.5.tar.gz"
    sha256 "8cc73c0a0bfca7dbfa59235d60b2eff82231dee33f53d206db1acd9173cfc0a7"
  end

  def install
    ENV["SETUPTOOLS_SCM_PRETEND_VERSION_FOR_CAL_AUTOMATION"] = version.to_s
    virtualenv_install_with_resources
  end

  test do
    assert_match "sync", shell_output("#{bin}/cal-automation --help 2>&1")
  end
end
