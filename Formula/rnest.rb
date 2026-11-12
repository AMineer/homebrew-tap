class Rnest < Formula
  desc "RasterNest command-line screen capture, OCR and export"
  homepage "https://rasternest.app"
  # macOS: universal binary. Linux builds override the URL below.
  url "https://github.com/AMineer/rasternest_app/releases/download/v0.4.0/rnest-0.4.0-macos-universal.tar.gz"
  sha256 "c72d81cedb293c4352df231b3a3aa62be3d8be76576e76233df75e90903b7676"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/AMineer/rasternest_app/releases/download/v0.4.0/rnest-0.4.0-linux-x86_64.tar.gz"
      sha256 "4366b27885fc37daa0c513ff38f6e937450cd0df8562f364687bb58da7fa5605"
    end
    on_arm do
      url "https://github.com/AMineer/rasternest_app/releases/download/v0.4.0/rnest-0.4.0-linux-aarch64.tar.gz"
      sha256 "674dc555c350fc75286f6759f1012210c621d9e9c1a949a30ee03ab41061e63c"
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
