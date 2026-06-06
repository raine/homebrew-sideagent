class AgentOffload < Formula
  desc "Launch coding agents in tmux panes and wait for completion"
  homepage "https://github.com/raine/agent-offload"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/agent-offload/releases/download/v0.1.4/agent-offload-darwin-arm64.tar.gz"
      sha256 "6e371beb87b3d60c77a026570e33e3fc13b168027585304e2ecd8e00a376c338"
    else
      url "https://github.com/raine/agent-offload/releases/download/v0.1.4/agent-offload-darwin-amd64.tar.gz"
      sha256 "1daee9a7891970f3fa8332510f456c49df9334200a99728b91554f0cc5c51702"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/agent-offload/releases/download/v0.1.4/agent-offload-linux-arm64.tar.gz"
      sha256 "c10932fec866c55f2016e5b9a66c958795c860fca4e3b5440cb775bebf223b4c"
    else
      url "https://github.com/raine/agent-offload/releases/download/v0.1.4/agent-offload-linux-amd64.tar.gz"
      sha256 "00cd8533eb7a0498108c74933e2fe5ddffcdd9c935fa87b8389fe1b6eb5fed60"
    end
  end

  def install
    bin.install "agent-offload"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agent-offload --version")
  end
end
