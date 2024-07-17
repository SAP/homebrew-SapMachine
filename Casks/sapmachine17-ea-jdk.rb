cask "sapmachine17-ea-jdk" do
  version "17.0.12,7"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "7734fddc7695a86e1c4b02e969ff91f7cd5dc610c045a3b8313f022e34245ae4",
         intel: "2939eb96a8d9e7431b5cc93b6d9508bbcb51fdca10f21ad0c88bec224dcc3c68"

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
