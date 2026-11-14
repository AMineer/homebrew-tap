class Rnest < Formula
  desc "RasterNest command-line screen capture, OCR and export"
  homepage "https://rasternest.app"
  # macOS: universal binary. Linux builds override the URL below.
  url "https://github.com/AMineer/rasternest_app/releases/download/v0.4.2/rnest-0.4.2-macos-universal.tar.gz"
  sha256 "d4cfe4fdb0a79d661017335fcbeade598e77cffc92a8ba98fa51015b7127f39c"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/AMineer/rasternest_app/releases/download/v0.4.2/rnest-0.4.2-linux-x86_64.tar.gz"
      sha256 "082f2f3c0f1b424c777616b1576182749d14fe53c30556b68290505a309310f9"
    end
    on_arm do
      url "https://github.com/AMineer/rasternest_app/releases/download/v0.4.2/rnest-0.4.2-linux-aarch64.tar.gz"
      sha256 "f8e60942639795e4605e9788db6c54d8b0dcaa45c9fbb68ec1e4adb96a100183"
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
