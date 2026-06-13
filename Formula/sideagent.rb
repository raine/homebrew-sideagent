class Sideagent < Formula
  desc "Run another coding agent from your current session"
  homepage "https://github.com/raine/sideagent"
  version "0.1.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/sideagent/releases/download/v0.1.10/sideagent-darwin-arm64.tar.gz"
      sha256 "0c30c2eaf6338fbf0726cc40a4434002be358d117bbd6ff9d5f72e242416faf3"
    else
      url "https://github.com/raine/sideagent/releases/download/v0.1.10/sideagent-darwin-amd64.tar.gz"
      sha256 "92164b1d17115ad5da78c0d2c28a0ac0b60cb8d424cdb93aa54b01f7e07d18f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/sideagent/releases/download/v0.1.10/sideagent-linux-arm64.tar.gz"
      sha256 "1d42b0ba9f32c290b6ef63cdb903782187084f8d11050c7dd5388e295dbabb27"
    else
      url "https://github.com/raine/sideagent/releases/download/v0.1.10/sideagent-linux-amd64.tar.gz"
      sha256 "f19bf88e6e13b67afba73b6e8e247eaad93865c7f18c3c9c7b102fe8c06bf947"
    end
  end

  def install
    bin.install "sideagent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sideagent --version")
  end
end
