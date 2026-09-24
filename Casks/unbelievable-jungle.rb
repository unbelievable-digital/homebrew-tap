cask "unbelievable-jungle" do
  version "2.4.0"
  sha256 "563655e781d0bd3f68daa9c4bf990f1160766c4a29f0edcc2b9ac62898abb3ab"

  url "https://github.com/unbelievable-digital/unbelievable-jungle-releases/releases/download/v#{version}/UnbelievableJungle-#{version}.zip"
  name "Unbelievable Jungle"
  desc "Desktop pet cat, dog or monkey that lives on top of your windows"
  homepage "https://jungle.unbelievable.digital/"

  livecheck do
    url "https://raw.githubusercontent.com/unbelievable-digital/unbelievable-jungle-releases/main/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Unbelievable Jungle.app"

  # Only Unbelievable Jungle's own sandbox container and the App Group it shares with the retired
  # Unbelievable Cat app (the pet hand-over bridge). Photos in ~/Pictures/Unbelievable Cat are the
  # user's and are never touched.
  zap trash: [
    "~/Library/Application Scripts/digital.unbelievable.jungle",
    "~/Library/Containers/digital.unbelievable.jungle",
    "~/Library/Group Containers/Y7XRPUL72Z.digital.unbelievable.pet",
  ]
end
