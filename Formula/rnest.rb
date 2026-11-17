class Rnest < Formula
  desc "RasterNest command-line screen capture, OCR and export"
  homepage "https://rasternest.app"
  # macOS: universal binary. Linux builds override the URL below.
  url "https://github.com/AMineer/rasternest_app/releases/download/v0.5.0/rnest-0.5.0-macos-universal.tar.gz"
  sha256 "8bf0bc7a8ba0bdf25918c3c5a7dfbec231f6b8285267af24c8f2c5bc9a4e082d"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/AMineer/rasternest_app/releases/download/v0.5.0/rnest-0.5.0-linux-x86_64.tar.gz"
      sha256 "674e0e8c9eb7aab89b8f1f608f949e501c6a2c7b19fb415b8f77ad400b7324a0"
    end
    on_arm do
      url "https://github.com/AMineer/rasternest_app/releases/download/v0.5.0/rnest-0.5.0-linux-aarch64.tar.gz"
      sha256 "7724ff945f5c2186fe68a6d2213b9d1bf30f4d0febf626e35123cfa8c49f17a5"
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
