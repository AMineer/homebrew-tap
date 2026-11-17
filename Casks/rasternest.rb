cask "rasternest" do
  version "0.5.0"
  sha256 "35b881ffad96700db48d027f84c244dda81655cdf0d752b248bc7617a7a16cf7"

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
