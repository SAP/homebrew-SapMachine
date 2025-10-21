cask "sapmachine21-jre" do
  version "21.0.9"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "50622f969c8757c43da6be87e4aa63b0b104a7853db500378168c4437939fdb4",
         intel: "1fb556274942e6f736b702b7309ce7dc68bf30fc82226ef713e9fa142a64894c"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jre-#{version}_macos-#{arch}_bin.dmg",
      verified: "github.com/SAP/SapMachine/"

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
