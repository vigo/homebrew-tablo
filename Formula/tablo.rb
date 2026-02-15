class Tablo < Formula
  desc "`tablo` is a CLI data pipeline tool that transforms tabular data into formatted ASCII tables"
  homepage "https://github.com/vigo/tablo"
  url "https://github.com/vigo/tablo/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "deb2e1f6168e4e0ce5047d7bd25e50f9db0d13b82a41f7caf82ebd0618c340da"
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
