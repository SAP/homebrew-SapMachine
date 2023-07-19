cask "sapmachine11-jdk" do
  version "11.0.20"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "ff60fcc8ebd2a5f76fa7e318f5c046ab888ebcf91ae3b5937b7fd9d012f74a4b",
         intel: "016c4622d57d4110189d73df8061dd5bde5f5632fc0e092e40076a64b6fcb591"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jdk-#{version}_macos-#{arch}_bin.dmg",
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

  artifact "sapmachine-jdk-#{version}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jdk"
end
