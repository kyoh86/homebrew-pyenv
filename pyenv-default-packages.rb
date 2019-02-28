class PyenvDefaultPackages < Formula
  homepage "https://github.com/kyoh86/pyenv-default-packages"
  head "https://github.com/kyoh86/pyenv-default-packages.git"
  url "https://github.com/kyoh86/pyenv-default-packages/archive/0.3.1.tar.gz"
  sha256 "163ea3f5b98aef826d3c6c8d4177c99c006faf87877a30d7828e897c97d5e9cc"

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
