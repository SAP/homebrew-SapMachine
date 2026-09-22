cask "sapmachine17-ea-jdk" do
  version "17.0.21,7"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "ff41aada55e3dd0b99b8a587580e10659c5a050a9a905eb682d610f770accae5",
         intel: "dd4540f8fc5778c6e2708150eb6582d08dcade4cf8f3069a79e5af8ca58e3e4f"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jdk-#{version.before_comma}-ea.#{version.after_comma}_macos-#{arch}_bin.dmg"

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
