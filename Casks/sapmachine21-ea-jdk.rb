cask "sapmachine21-ea-jdk" do
  version "21.0.5,2"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "a6c226da8270b886a291ce213b1927f4c0a2e3c4d7f0e1f1149b8fe9f8ea3a05",
         intel: "fe690e99073658ff3fda1cd2b703e792eddcb34fe15002c96915b2e1b79ddfed"

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
