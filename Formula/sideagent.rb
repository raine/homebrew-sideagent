class Sideagent < Formula
  desc "Run another coding agent from your current session"
  homepage "https://github.com/raine/sideagent"
  version "0.1.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/sideagent/releases/download/v0.1.8/sideagent-darwin-arm64.tar.gz"
      sha256 "b9bde75d275108fe29d7eb79e9aead0b90d8e263e32a3136daca72900ef4186b"
    else
      url "https://github.com/raine/sideagent/releases/download/v0.1.8/sideagent-darwin-amd64.tar.gz"
      sha256 "40670b65b143fce9911ed805ce776b8f25e4898528f0e8eb09f4230b4f38b000"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/sideagent/releases/download/v0.1.8/sideagent-linux-arm64.tar.gz"
      sha256 "ef75c31bf5bb40a9ecd11ef8966eaae275be8cb6b3e5c27cd0f9ba8c259fdeea"
    else
      url "https://github.com/raine/sideagent/releases/download/v0.1.8/sideagent-linux-amd64.tar.gz"
      sha256 "60a0363548440155d5bfc6f0ac58eda9e85d5d74c3bed72c4f9ed74b46711be9"
    end
  end

  def install
    bin.install "sideagent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sideagent --version")
  end
end
