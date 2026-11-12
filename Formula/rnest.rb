class Rnest < Formula
  desc "RasterNest command-line screen capture, OCR and export"
  homepage "https://rasternest.app"
  # macOS: universal binary. Linux builds override the URL below.
  url "https://github.com/AMineer/rasternest_app/releases/download/v0.2.0/rnest-0.2.0-macos-universal.tar.gz"
  sha256 "c96471175241309740515fe63a091e745913f873cb7e70769a2022bac4df2f81"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/AMineer/rasternest_app/releases/download/v0.2.0/rnest-0.2.0-linux-x86_64.tar.gz"
      sha256 "8704c44aa4c4827c2439ea33a66d57582a0739b689d1dc53838ada4a520b6d83"
    end
    on_arm do
      url "https://github.com/AMineer/rasternest_app/releases/download/v0.2.0/rnest-0.2.0-linux-aarch64.tar.gz"
      sha256 "b54e1cdc0c1c0cad16f658dc98c67289d9907cf4764b55f6ad32137ca913bb9a"
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
