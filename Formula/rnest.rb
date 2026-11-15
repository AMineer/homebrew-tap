class Rnest < Formula
  desc "RasterNest command-line screen capture, OCR and export"
  homepage "https://rasternest.app"
  # macOS: universal binary. Linux builds override the URL below.
  url "https://github.com/AMineer/rasternest_app/releases/download/v0.4.4/rnest-0.4.4-macos-universal.tar.gz"
  sha256 "b521740a4c470dcf919f85d3bcf604e3659bc369cc62728334eaf16dc8bc174d"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/AMineer/rasternest_app/releases/download/v0.4.4/rnest-0.4.4-linux-x86_64.tar.gz"
      sha256 "88f7d26a2c89bea626b5e1e5d8c62358ee36c26893a66fdbdc01233ca9a7d84e"
    end
    on_arm do
      url "https://github.com/AMineer/rasternest_app/releases/download/v0.4.4/rnest-0.4.4-linux-aarch64.tar.gz"
      sha256 "60f38229a3247ebac7c5c454dbb94546a9ec97aa677f91ce5384cfa5c9e29f7e"
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
