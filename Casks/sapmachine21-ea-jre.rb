cask "sapmachine21-ea-jre" do
  version "21.0.8,3"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "a746b8cab85dbc96ea3f1b33d9e1a0b3b8097e9d1cd9196087763b61f7d4fc4c",
         intel: "4659c29faba296231b7e737bf73e8c2b4dfee33cd9bb6dd328d5a161b0cb08dc"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jre-#{version.before_comma}-ea.#{version.after_comma}_macos-#{arch}_bin.dmg",
      verified: "github.com/SAP/SapMachine/"

  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK distribution from SAP"
  homepage "https://sapmachine.io/"

  # Check for latest version in SapMachine release data.
  livecheck do
    url "https://sap.github.io/SapMachine/assets/data/sapmachine-releases-latest.json"
    regex(/["']tag["']:\s*["']sapmachine[._-]v?(\d+(?:\.\d+)*)["']/i)
  end

  artifact "sapmachine-jre-#{version.before_comma}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}-ea.jre"
end
