class Uso < Formula
  desc "Switch AI CLI tool profiles with a single command"
  homepage "https://github.com/bejoinka/uso"
  url "https://github.com/bejoinka/uso/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "59197aa99e20867d4317ddf840755c622ade417a8768b81b5d640c5d1dd4dc3f"
  license "MIT"

  def install
    (share/"uso").install "uso.sh"
    (share/"uso").install "examples"
  end

  def caveats
    <<~EOS
      Add to your ~/.zshrc or ~/.bashrc:

        source "$(brew --prefix)/share/uso/uso.sh"

      Then restart your shell and run:

        uso init
    EOS
  end

  test do
    assert_match "uso", shell_output("bash -c 'source #{share}/uso/uso.sh && uso help'")
  end
end
