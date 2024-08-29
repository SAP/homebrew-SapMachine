cask "sapmachine21-ea-jdk" do
  version "21.0.5,4"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "b43b5cca8f5a2d8f8c9c890bcda22c631893143fe2720d5ee9b9c4a99b1fa58a",
         intel: "06390b7ac95e553a111b9ac23ed169868dc4f6bae3bbc4cb72c2d5c1344655ce"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jdk-#{version.before_comma}-ea.#{version.after_comma}_macos-#{arch}_bin.dmg",
      verified: "github.com/SAP/SapMachine/"

  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK distribution from SAP"
  homepage "https://sapmachine.io/"

  # Check for latest version in SapMachine release data.
  livecheck do
    url "https://sap.github.io/SapMachine/assets/data/sapmachine-releases-latest.json"
    regex(/["']tag["']:\s*["']sapmachine[._-]v?(\d+(?:\.\d+)*)["']/i)
  end

  artifact "sapmachine-jdk-#{version.before_comma}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}-ea.jdk"
end
