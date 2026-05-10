class Tablo < Formula
  desc "CLI tool that transforms tabular data into formatted ASCII tables"
  homepage "https://github.com/vigo/tablo"
  url "https://github.com/vigo/tablo/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "fa9843b556af6b6ea4aed8bcea19e34c9d2c5a57a6be03c4d7b4a642dec16a4c"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    output = shell_output("#{bin}/tablo -version 2>&1")
    assert_match version.to_s, output
  end
end
