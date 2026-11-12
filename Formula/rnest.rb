class Rnest < Formula
  desc "RasterNest command-line screen capture, OCR and export"
  homepage "https://rasternest.app"
  # macOS: universal binary. Linux builds override the URL below.
  url "https://github.com/AMineer/rasternest_app/releases/download/v0.3.0/rnest-0.3.0-macos-universal.tar.gz"
  sha256 "b4ae063a813497a890c8e8704f9815425d9a71eeed54db00a161b16e49f85ed4"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/AMineer/rasternest_app/releases/download/v0.3.0/rnest-0.3.0-linux-x86_64.tar.gz"
      sha256 "e4c661f55faca8b4af288dcb9329b944a4161abbe258ff0de7eec42e1c73ba1d"
    end
    on_arm do
      url "https://github.com/AMineer/rasternest_app/releases/download/v0.3.0/rnest-0.3.0-linux-aarch64.tar.gz"
      sha256 "02911552e33ba274ea6a14dafaa9557f8b0387073d6b010fc24e8942d929d8cd"
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
