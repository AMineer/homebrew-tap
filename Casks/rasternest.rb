cask "rasternest" do
  version "0.4.1"
  sha256 "6b1945bea1decc68f8c17cc07e812fb1504f96cb01978731ff077a2d066d5338"

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
