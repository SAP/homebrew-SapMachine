cask "sapmachine17-jre" do
  version "17.0.8.1"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "2e3b259d6b1ada63c17837dd903163f04cf96f3f37df4fa045ad461c3d0f470b",
         intel: "783583d30a0848b2c0f4a06fa6435b37961de79fbaebc2f1de0b1ef18916ab5a"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jre-#{version}_macos-#{arch}_bin.dmg",
      verified: "github.com/SAP/SapMachine/"

  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK distribution from SAP"
  homepage "https://sapmachine.io/"

  # The version information on the homepage is rendered client-side from the
  # following JSON file, so we have to check it instead.
  livecheck do
    url "https://sap.github.io/SapMachine/assets/data/sapmachine_releases.json"
    regex(/["']tag["']:\s*["']sapmachine[._-]v?(\d+(?:\.\d+)*)["']/i)
  end

  artifact "sapmachine-jre-#{version}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jre"
end
