class AgentOffload < Formula
  desc "Launch coding agents in tmux panes and wait for completion"
  homepage "https://github.com/raine/agent-offload"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/agent-offload/releases/download/v0.1.1/agent-offload-darwin-arm64.tar.gz"
      sha256 "61b270c8e23ba6405ff3f322c8bd9780538a5460a4e22482b84508e6a57c7bd5"
    else
      url "https://github.com/raine/agent-offload/releases/download/v0.1.1/agent-offload-darwin-amd64.tar.gz"
      sha256 "e90f3806d639d6c1acdacfcdefade5f99963444337ba262585b817c0148a9f0e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/agent-offload/releases/download/v0.1.1/agent-offload-linux-arm64.tar.gz"
      sha256 "5b4918c839f4a2f72e4236bbccd2358d7766e84fe9c3816cbf976704a3f6e4af"
    else
      url "https://github.com/raine/agent-offload/releases/download/v0.1.1/agent-offload-linux-amd64.tar.gz"
      sha256 "a5a9bd1e943c90274df57f14c48997af88fce77dfd7911ac604a26d36bded1db"
    end
  end

  def install
    bin.install "agent-offload"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agent-offload --version")
  end
end
