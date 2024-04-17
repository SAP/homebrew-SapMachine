cask "sapmachine21-jdk" do
  version "21.0.3"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "5a5464ad09c5b32379da37d28f0328f0ab48ef438edd7aae8fdbbc0dcfe33010",
         intel: "8b9821759159ac1d9f5add962cd0e57fe8b63a402a035e3ccf2ec4e48b4aa3e8"

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
