class Agx < Formula
  desc "Context exchange, session diffing, search, and backup engine for Google Antigravity"
  homepage "https://github.com/imsaba16/agx"
  version "1.0.0-rc.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/imsaba16/agx/releases/download/v#{version}/agx-macos-arm64.tar.gz"
      sha256 "34d028aa925aca9159dd5055901b6c4e31d2a29a113681ec55526a6fc655a010"
    else
      url "https://github.com/imsaba16/agx/releases/download/v#{version}/agx-macos-x86_64.tar.gz"
      sha256 "52bc676e231c21a21b2d981cac5eb897ee6248fd352130aea2b79057b32c5f6b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/imsaba16/agx/releases/download/v#{version}/agx-linux-x86_64.tar.gz"
      sha256 "3b47b071b17ef1f93f7457521fb5b227803792b33e21df4736e46a5b4df371af"
    end
  end

  def install
    bin.install "agx"

    # Automatically generate and install shell completions
    generate_completions_from_executable(bin/"agx", "completion")
  end

  test do
    assert_match "agx #{version}", shell_output("#{bin}/agx --version")
  end
end
