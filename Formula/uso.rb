class Uso < Formula
  desc "Switch AI CLI tool profiles with a single command"
  homepage "https://github.com/bejoinka/uso"
  url "https://github.com/bejoinka/uso/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "cbdf4af4f458716d84454f27659465ac297bfdec25c5d5969a07bc3780658864"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  def caveats
    <<~EOS
      Add to your ~/.zshrc:

        eval "$(command uso hook zsh)"

      Or ~/.bashrc:

        eval "$(command uso hook bash)"

      Then restart your shell and run:

        uso init
    EOS
  end

  test do
    assert_match "Switch AI CLI tool profiles", shell_output("#{bin}/uso --help")
  end
end
