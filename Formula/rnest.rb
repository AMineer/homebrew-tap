class Rnest < Formula
  desc "RasterNest command-line screen capture, OCR and export"
  homepage "https://rasternest.app"
  # macOS: universal binary. Linux builds override the URL below.
  url "https://github.com/AMineer/rasternest_app/releases/download/v0.5.1/rnest-0.5.1-macos-universal.tar.gz"
  sha256 "ca38f4286c6b1ab7ffe664aa29a4434857decdabfccc6cf38ec6a132e8d380cb"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/AMineer/rasternest_app/releases/download/v0.5.1/rnest-0.5.1-linux-x86_64.tar.gz"
      sha256 "194b7a20584334ecf61718591f16e5237455f655673a088cf9c3305367649e3b"
    end
    on_arm do
      url "https://github.com/AMineer/rasternest_app/releases/download/v0.5.1/rnest-0.5.1-linux-aarch64.tar.gz"
      sha256 "1ac95bc5662ce80fbf13b7f53fe1211f3659623c599c317eedc57fd5b7e48e6d"
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
