cask "sapmachine23-jdk" do
  version "23.0.2"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "80eb38e4ae04927e32aace36ddfdd79c8532765855aca5bb3b3c54b21dfe30fa",
         intel: "c2eafe9246c3e0401c90d49a5b7d7b57c53d81b2e14c6f300a6d385510c449aa"

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
