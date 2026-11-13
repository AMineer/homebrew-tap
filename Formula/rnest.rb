class Rnest < Formula
  desc "RasterNest command-line screen capture, OCR and export"
  homepage "https://rasternest.app"
  # macOS: universal binary. Linux builds override the URL below.
  url "https://github.com/AMineer/rasternest_app/releases/download/v0.4.1/rnest-0.4.1-macos-universal.tar.gz"
  sha256 "5db8c8f3c3117567f7c42bd97c33f7a8a98364771e5e7e6343228c752a6aab31"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/AMineer/rasternest_app/releases/download/v0.4.1/rnest-0.4.1-linux-x86_64.tar.gz"
      sha256 "125cf3150cb15444ce8a820e93a65bf2a8282bbb61649d29945d38dc46827cbd"
    end
    on_arm do
      url "https://github.com/AMineer/rasternest_app/releases/download/v0.4.1/rnest-0.4.1-linux-aarch64.tar.gz"
      sha256 "b7b2123ad8209fe82ce38d0bf0f7dc4746c16c64d0e372b765eae05217782f5b"
    end
  end

  def install
    bin.install "rnest"
  end

  def caveats
    on_linux do
      <<~EOS
        rnest drives an installed screenshot tool. Install one of:
          Wayland: grim + slurp, gnome-screenshot, or spectacle
          X11:     maim + slop, scrot, or imagemagick
        Optional: wl-clipboard or xclip (--clipboard), tesseract (ocr).
      EOS
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rnest --version")
  end
end
