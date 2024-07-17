cask "sapmachine11-jdk" do
  version "11.0.24"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "946ff7259a882d299eed788852f34802a7eadff909ecc0bc354905d278ef31b5",
         intel: "598c9004a65ce27856b3a27de8d4962e1fcbc755a1d0640a6a6aa155fe636ca7"

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
