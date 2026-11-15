class Rnest < Formula
  desc "RasterNest command-line screen capture, OCR and export"
  homepage "https://rasternest.app"
  # macOS: universal binary. Linux builds override the URL below.
  url "https://github.com/AMineer/rasternest_app/releases/download/v0.4.3/rnest-0.4.3-macos-universal.tar.gz"
  sha256 "fb1645ab6efab2a972aceed1bd828b6aa246ad6e4010acbd8ca8f2b7bb726be7"
  license "MIT"

  on_linux do
    on_intel do
      url "https://github.com/AMineer/rasternest_app/releases/download/v0.4.3/rnest-0.4.3-linux-x86_64.tar.gz"
      sha256 "bae705c785bdbb341604aa2bdc35ecf1beada8bc6ca3e4fa9d79afaf601e33b0"
    end
    on_arm do
      url "https://github.com/AMineer/rasternest_app/releases/download/v0.4.3/rnest-0.4.3-linux-aarch64.tar.gz"
      sha256 "5929f596e0cda5fdd15e1b0329ac8ffb6aca1007d7d751ed9b33624ecff82475"
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
