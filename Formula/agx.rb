class Agx < Formula
  desc "Context exchange, session diffing, search, and backup engine for Google Antigravity"
  homepage "https://github.com/imsaba16/agx"
  version "1.0.0-rc.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/imsaba16/agx/releases/download/v#{version}/agx-macos-arm64.tar.gz"
      sha256 "CHANGEME_MACOS_ARM64_SHA256"
    else
      url "https://github.com/imsaba16/agx/releases/download/v#{version}/agx-macos-x86_64.tar.gz"
      sha256 "CHANGEME_MACOS_X86_64_SHA256"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/imsaba16/agx/releases/download/v#{version}/agx-linux-x86_64.tar.gz"
      sha256 "CHANGEME_LINUX_X86_64_SHA256"
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
