class Sideagent < Formula
  desc "Launch coding agents in tmux panes and wait for completion"
  homepage "https://github.com/raine/sideagent"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/sideagent/releases/download/v0.1.5/sideagent-darwin-arm64.tar.gz"
      sha256 "bd4b451ec05a37fc859c37da5e88d057d35a9bbb7f06f43987367daa292abaa8"
    else
      url "https://github.com/raine/sideagent/releases/download/v0.1.5/sideagent-darwin-amd64.tar.gz"
      sha256 "b3986d98a9f6fb4f399dc9fb866f93f48683d99318ee1eab28323e321c75bd21"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/sideagent/releases/download/v0.1.5/sideagent-linux-arm64.tar.gz"
      sha256 "507940ac568a1dd46a2b241ee87a03cba196bae4a3a2791fb50882c2ee13991b"
    else
      url "https://github.com/raine/sideagent/releases/download/v0.1.5/sideagent-linux-amd64.tar.gz"
      sha256 "ac12473e9be3071eb09061e9fa823ad32f751c81e614246c27c119eae55fd0b3"
    end
  end

  def install
    bin.install "sideagent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sideagent --version")
  end
end
