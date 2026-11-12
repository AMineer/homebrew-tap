cask "rasternest" do
  version "0.1.0"
  sha256 "cad242e82b455f8c0eaf1c239f5f39825b148de740baa32c33387242edc127e3"

  url "https://github.com/AMineer/rasternest_app/releases/download/v#{version}/RasterNest-#{version}.dmg"
  name "RasterNest"
  desc "Open-source screen capture and markup tool"
  homepage "https://rasternest.app"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "RasterNest.app"
  binary "#{appdir}/RasterNest.app/Contents/Helpers/rnest"

  uninstall quit: "app.rasternest.RasterNest"

  zap trash: [
    "~/Library/Preferences/app.rasternest.RasterNest.plist",
    "~/Library/Saved Application State/app.rasternest.RasterNest.savedState",
  ]
end
