cask "sapmachine11-jdk" do
  version "11.0.24"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "71902b0e220c669f9c66bd4ab278d274c758722cc49d63cc067217273eff8711",
         intel: "3cba4b420d5309691c51e3b348779dbdd6ed276db2d4d0f4746b2051e50fb95c"

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
