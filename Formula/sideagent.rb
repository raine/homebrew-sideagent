class Sideagent < Formula
  desc "Run another coding agent from your current session"
  homepage "https://github.com/raine/sideagent"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/sideagent/releases/download/v0.1.6/sideagent-darwin-arm64.tar.gz"
      sha256 "3fb69a39376ae710902370454cd4c156407d2763d5ed6a982f91eab674f6b2f6"
    else
      url "https://github.com/raine/sideagent/releases/download/v0.1.6/sideagent-darwin-amd64.tar.gz"
      sha256 "27146d186c342acf68cc32c77ea36c6ee34e66b34aac713ab407f5ba2f09d3ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/sideagent/releases/download/v0.1.6/sideagent-linux-arm64.tar.gz"
      sha256 "06692a8b4ce0be39ec67b08011456d3c9062e3d6ccd6afede89956ebca2006fd"
    else
      url "https://github.com/raine/sideagent/releases/download/v0.1.6/sideagent-linux-amd64.tar.gz"
      sha256 "4878f927da12e4e0a315b2fe18e663448e161ad4645c587dca6c2056c972a71a"
    end
  end

  def install
    bin.install "sideagent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sideagent --version")
  end
end
