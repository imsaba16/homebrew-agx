class Agx < Formula
  desc "Context exchange, session diffing, search, and backup engine for Google Antigravity"
  homepage "https://github.com/imsaba16/agx"
  version "1.0.0-rc.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/imsaba16/agx/releases/download/v#{version}/agx-macos-arm64.tar.gz"
      sha256 "17739aa45916560a7a6c62aa153274500946d02d2d227d007d6d8ebce7e01559"
    end
    on_intel do
      url "https://github.com/imsaba16/agx/releases/download/v#{version}/agx-macos-x86_64.tar.gz"
      sha256 "7fad8ae311c179a1cfba74ec82bfe2733f3e1d7ac888dd403a6b50df0a7185d7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/imsaba16/agx/releases/download/v#{version}/agx-linux-x86_64.tar.gz"
      sha256 "e2379dd5536b44d9397d8f206095b20310cf4d49c288b713dd3048ef1b4b8d1e"
    end
    on_arm do
      url "https://github.com/imsaba16/agx/releases/download/v#{version}/agx-linux-arm64.tar.gz"
      sha256 "2247ed1d4ee9a57ef0e48938993deb9ccacab057faa99e2e8060682de98b23a0"
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
