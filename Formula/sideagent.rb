class Sideagent < Formula
  desc "Launch coding agents in tmux panes and wait for completion"
  homepage "https://github.com/raine/sideagent"
  url "https://github.com/raine/sideagent/archive/5501a3098907f4c9f167b539eff7566e7e6846cd.tar.gz"
  sha256 "04581ba2b217c2d33001add3150efacde92f0fec1162833fe6526a4031d501a1"
  version "0.1.4"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--path", ".", "--root", prefix
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sideagent --version")
  end
end
