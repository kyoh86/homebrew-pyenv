class PyenvDefaultPackages < Formula
  homepage "https://github.com/kyoh86/pyenv-default-packages"
  head "https://github.com/kyoh86/pyenv-default-packages.git"
  url "https://github.com/kyoh86/pyenv-default-packages/archive/v0.3.2.tar.gz"
  sha256 "d27fb8a3e078aa3168471d586a36d6ed9c41a5a54ec6cfeb6cdd4f0e055312d6"

  depends_on "pyenv"
  depends_on "pyenv-virtualenv" => :recommended

  def install
    ENV["PREFIX"] = prefix
    system "./install.sh"
  end

  test do
    assert shell_output("pyenv hooks install").include? "default-packages.bash"
    if build.with? "pyenv-virtualenv"
      assert shell_output("pyenv hooks virtualenv").include? "default-packages.bash"
    end
  end
end
