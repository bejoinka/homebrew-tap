class Uso < Formula
  desc "Switch AI CLI tool profiles with a single command"
  homepage "https://github.com/bejoinka/uso"
  url "https://github.com/bejoinka/uso/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "821fbd2751c47fe4ba86544110d1a5f3fdbb08168c109458fea96dd86ec0bf45"
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
