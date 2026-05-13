class Tablo < Formula
  desc "CLI tool that transforms tabular data into formatted ASCII tables"
  homepage "https://github.com/vigo/tablo"
  url "https://github.com/vigo/tablo/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "4b2533adbd336584eec6c21948ccb33547e6457ae5be3cc3d5f4fb1c8ee4d74c"
  license "MIT"

  bottle do
    root_url "https://github.com/vigo/homebrew-tablo/releases/download/tablo-0.4.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "948f251c902868486403c864f256ca5a4b33abfc53575d6b8f96725f603d85ba"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "65e39fcfbb0dcab2cbe8c3de314d13185dc07cdc3cd598a07e4a0a50fcf3fe28"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
    generate_completions_from_executable(
      bin/"tablo",
      "--bash-completion",
      shell_parameter_format: :none,
      shells:                 [:bash],
    )
  end

  test do
    output = shell_output("#{bin}/tablo -version 2>&1")
    assert_match version.to_s, output
  end
end
