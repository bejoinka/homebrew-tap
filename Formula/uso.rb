class Uso < Formula
  desc "Switch AI CLI tool profiles with a single command"
  homepage "https://github.com/bejoinka/uso"
  url "https://github.com/bejoinka/uso/archive/refs/tags/v0.7.1.tar.gz"
  sha256 "1db72b76a91127dbd62054d28449cb51904a6ce057026b747d640d481b99787e"
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
