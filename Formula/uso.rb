class Uso < Formula
  desc "Switch AI CLI tool profiles with a single command"
  homepage "https://github.com/bejoinka/uso"
  url "https://github.com/bejoinka/uso/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "2fac05c64a99ef98b110d0c99992f18bf39b27a43b6b0f8583fa9b044abbcc6c"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  def caveats
    <<~EOS
      Add to your ~/.zshrc:

        eval "$(uso hook zsh)"

      Or ~/.bashrc:

        eval "$(uso hook bash)"

      Then restart your shell and run:

        uso init
    EOS
  end

  test do
    assert_match "Switch AI CLI tool profiles", shell_output("#{bin}/uso --help")
  end
end
