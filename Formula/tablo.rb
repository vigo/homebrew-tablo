class Tablo < Formula
  desc "CLI tool that transforms tabular data into formatted ASCII tables"
  homepage "https://github.com/vigo/tablo"
  url "https://github.com/vigo/tablo/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "4b2533adbd336584eec6c21948ccb33547e6457ae5be3cc3d5f4fb1c8ee4d74c"
  license "MIT"

  bottle do
    root_url "https://github.com/vigo/homebrew-tablo/releases/download/tablo-0.4.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "5205027f47f898f6487fd1720a56c9e90322c17d618e60c8b1c0630f925d9559"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1f5e2dae09974b20924aea104d18919126b1477a8bf88a511676b41a4a546bca"
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
