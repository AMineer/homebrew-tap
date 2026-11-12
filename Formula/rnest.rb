class Rnest < Formula
  desc "RasterNest command-line screen capture, OCR and export"
  homepage "https://rasternest.app"
  # macOS: universal binary. Linux builds override the URL below.
  url "https://github.com/AMineer/rasternest_app/releases/download/v0.1.0/rnest-0.1.0-macos-universal.tar.gz"
  sha256 "f65f07280767a44a6c722992761019bb9a4b0b6981baa307c0d7e92e1c7c49ce"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/AMineer/rasternest_app/releases/download/v0.1.0/rnest-0.1.0-linux-x86_64.tar.gz"
      sha256 "a4d6b6264cc6294aa4e68e999415ff5677feaa188d2c7c5ecd84784d242dcc7e"
    end
    on_arm do
      url "https://github.com/AMineer/rasternest_app/releases/download/v0.1.0/rnest-0.1.0-linux-aarch64.tar.gz"
      sha256 "fa730914ef168aafcdef68780d6f12c287b1079f067ab0aac9cb4379516fe189"
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
