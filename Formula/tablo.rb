class Tablo < Formula
  desc "`tablo` is a CLI data pipeline tool that transforms tabular data into formatted ASCII tables"
  homepage "https://github.com/vigo/tablo"
  url "https://github.com/vigo/tablo/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "c086ba5d976121c2a87f8accbd3101e55937d303d0db74a527fae1a635277597"
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
