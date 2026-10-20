cask "sapmachine21-jre" do
  version "21.0.13"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "96bfad39a66db0bc4c82bf83cc5020cb1a1a41049d4b6569b803cf7ab8c6a203",
         intel: "9ea88b42652a9be00ad1d4828fc01a2cecb9d9d61f5e8b8e682f810ff5a4f5ff"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jre-#{version}_macos-#{arch}_bin.dmg"

  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK distribution from SAP"
  homepage "https://sapmachine.io/"

  # Check for latest version in SapMachine release data.
  livecheck do
    url "https://sap.github.io/SapMachine/assets/data/sapmachine-releases-latest.json"
    regex(/["']tag["']:\s*["']sapmachine[._-]v?(\d+(?:\.\d+)*)["']/i)
  end

  artifact "sapmachine-jre-#{version}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jre"
end
