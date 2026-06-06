class AgentOffload < Formula
  desc "Launch coding agents in tmux panes and wait for completion"
  homepage "https://github.com/raine/agent-offload"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/agent-offload/releases/download/v0.1.2/agent-offload-darwin-arm64.tar.gz"
      sha256 "a4064d5c988ddba7f0dfb7e140bc71f1d1868a72bcc565c4350250e7237dc19f"
    else
      url "https://github.com/raine/agent-offload/releases/download/v0.1.2/agent-offload-darwin-amd64.tar.gz"
      sha256 "d81209f9417229423389b6cb60fe4397f5523463741910c46bd44a837f240e47"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/agent-offload/releases/download/v0.1.2/agent-offload-linux-arm64.tar.gz"
      sha256 "59c4fc016ae2000c2727bc0f81e01ba545b9ef179bb49fe6e5fbf3db4ad21681"
    else
      url "https://github.com/raine/agent-offload/releases/download/v0.1.2/agent-offload-linux-amd64.tar.gz"
      sha256 "92c929fbb3be299e52fa4a43051bd74c17e119b3c4800b31faad960b158b9e25"
    end
  end

  def install
    bin.install "agent-offload"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agent-offload --version")
  end
end
