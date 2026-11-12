cask "rasternest" do
  version "0.3.0"
  sha256 "9a6e8a3f9c027fe143863300531b0fc5934907ecb10d72a5b418ffd446fc0f8c"

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
