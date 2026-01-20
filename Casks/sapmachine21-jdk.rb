cask "sapmachine21-jdk" do
  version "21.0.10"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "047fd1c00489a410ea3dd1bf06aef07be8a073f8cddd0d244180715c5846baaf",
         intel: "fe9afdf3df78c567e3979a9a4567e5886d4c9a58cf3cebc859a1eae3cc2636c7"

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
