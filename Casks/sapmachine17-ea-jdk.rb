cask "sapmachine17-ea-jdk" do
  version "17.0.14,2"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "f53da6543ccfe2fbed5a6b6c319bdf7c24b41cbf1f86bf6225f60bb35bcad039",
         intel: "8c118c93c1e6802e3c79b658f84080a0ec2ededd12471ec4d35a7ac712a34dd0"

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
