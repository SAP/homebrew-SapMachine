cask "sapmachine21-jdk" do
  version "21.0.5"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "34d973c73ceb524bbf62ab829440049f8a678c2cac0698f0a8ffd91ebde58f77",
         intel: "e703ad727867af326d2f0a5619de2923052cc2b94870688a9a1e0646630544ed"

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
