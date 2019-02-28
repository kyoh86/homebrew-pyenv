class PyenvDefaultPackages < Formula
  homepage "https://github.com/kyoh86/pyenv-default-packages"
  head "https://github.com/kyoh86/pyenv-default-packages.git"
  url "https://github.com/kyoh86/pyenv-default-packages/archive/v0.3.2.tar.gz"
  sha256 "fb1a626338587aece44f4eb4e7f6929d51daf8541358627b8b832e6e43e72012"

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
