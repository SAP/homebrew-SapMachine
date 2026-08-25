cask "sapmachine17-ea-jdk" do
  version "17.0.21,3"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "29a555ea524b70d67542c6a6b3ed016cac0a7607751c88e0756c6ec49f3fc2ef",
         intel: "f13c61a5b50cbabcfe65367b16e8bd56f63e5b19d1f8bed8e0b30cfb904585d6"

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
