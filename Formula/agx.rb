class Agx < Formula
  desc "Context exchange, session diffing, search, and backup engine for Google Antigravity"
  homepage "https://github.com/imsaba16/agx"
  version "1.0.0-rc.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/imsaba16/agx/releases/download/v#{version}/agx-macos-arm64.tar.gz"
      sha256 "60673b577386f8860c27db7bddb5fa9f51dfeb4e8a432854414807d987fda21a"
    else
      url "https://github.com/imsaba16/agx/releases/download/v#{version}/agx-macos-x86_64.tar.gz"
      sha256 "2d65c85fb334c528b4caa3cc270426a815c6cad15eb12709095d16247a66b312"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/imsaba16/agx/releases/download/v#{version}/agx-linux-x86_64.tar.gz"
      sha256 "a7ff7eb642867fef2f52e879bb6e6843c6f8e623129a0fead8cc2c7ece899b6a"
    end
  end

  def install
    bin.install "agx"
    generate_completions_from_executable(bin/"agx", "completion")
  end

  test do
    assert_match "agx #{version}", shell_output("#{bin}/agx --version")
  end
end
