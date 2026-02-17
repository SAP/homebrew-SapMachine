cask "sapmachine21-jdk" do
  version "21.0.10.0.1"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "2f73cef6f41d30342f967b61a16f78a5ab55ea63f4eb48b0f0065ac52d769e75",
         intel: "8365fa6b0886144653c55cfae8aeaa1df4161591e27178453654d4e74f340a19"

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
