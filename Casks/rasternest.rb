cask "rasternest" do
  version "0.5.1"
  sha256 "abdec462ce2d6507faff46e59031188d672c2dd80f8de205db016fc914623f39"

  url "https://github.com/AMineer/rasternest_app/releases/download/v#{version}/RasterNest-#{version}.dmg"
  name "RasterNest"
  desc "Open-source screen capture and markup tool"
  homepage "https://rasternest.app"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "RasterNest.app"
  binary "#{appdir}/RasterNest.app/Contents/Helpers/rnest"

  uninstall quit: "app.rasternest.RasterNest"

  zap trash: [
    "~/Library/Preferences/app.rasternest.RasterNest.plist",
    "~/Library/Saved Application State/app.rasternest.RasterNest.savedState",
  ]
end
