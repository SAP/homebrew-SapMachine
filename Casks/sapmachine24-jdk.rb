cask "sapmachine24-jdk" do
  version "24.0.2"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "7bff8264a68a115dd623cafed199ac21fbf3307c823ffa477637f38bd9cbebfb",
         intel: "a1f1702231cbcbc6ee3bb6dddaf44b21ced473d17d296e9016b2b3ed05d29773"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jdk-#{version}_macos-#{arch}_bin.dmg",
      verified: "github.com/SAP/SapMachine/"

  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK distribution from SAP"
  homepage "https://sapmachine.io/"

  # Check for latest version in SapMachine release data.
  livecheck do
    url "https://sap.github.io/SapMachine/assets/data/sapmachine-releases-latest.json"
    regex(/["']tag["']:\s*["']sapmachine[._-]v?(\d+(?:\.\d+)*)["']/i)
  end

  artifact "sapmachine-jdk-#{version}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jdk"
end
