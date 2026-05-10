class Tablo < Formula
  desc "CLI tool that transforms tabular data into formatted ASCII tables"
  homepage "https://github.com/vigo/tablo"
  url "https://github.com/vigo/tablo/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "fa9843b556af6b6ea4aed8bcea19e34c9d2c5a57a6be03c4d7b4a642dec16a4c"
  license "MIT"

  bottle do
    root_url "https://github.com/vigo/homebrew-tablo/releases/download/tablo-0.3.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "63a353e4c04b97f7746225d8442e8d07a3ab46bbfdadba31d95c546fb9fc30e9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b2bd2a564397ef38b45da293c91e2d5a9c9d06fcf79000764154a7125600867b"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    output = shell_output("#{bin}/tablo -version 2>&1")
    assert_match version.to_s, output
  end
end
