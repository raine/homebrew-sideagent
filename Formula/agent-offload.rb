class AgentOffload < Formula
  desc "Launch coding agents in tmux panes and wait for completion"
  homepage "https://github.com/raine/agent-offload"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/agent-offload/releases/download/v0.1.3/agent-offload-darwin-arm64.tar.gz"
      sha256 "ad152ee7de8422f11526887c6d5474464e418990d40fc3aa9b1c7f19c3670576"
    else
      url "https://github.com/raine/agent-offload/releases/download/v0.1.3/agent-offload-darwin-amd64.tar.gz"
      sha256 "0b1cd8c11f85ce9c72d57203041d953f3faf8a798a766e587af775b4b795b9b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/agent-offload/releases/download/v0.1.3/agent-offload-linux-arm64.tar.gz"
      sha256 "2816be0c38b3b9bd2d2bc008ff6fe37ed36d6fc0eaa8d7db6841e784c0149396"
    else
      url "https://github.com/raine/agent-offload/releases/download/v0.1.3/agent-offload-linux-amd64.tar.gz"
      sha256 "53837f1597d33a54f9037c5b0ebccfd2e9d5f728d154cfcc83b002282e066644"
    end
  end

  def install
    bin.install "agent-offload"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agent-offload --version")
  end
end
