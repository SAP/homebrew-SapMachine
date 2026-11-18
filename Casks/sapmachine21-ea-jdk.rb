cask "sapmachine21-ea-jdk" do
  version "21.0.14,2"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "3f0a4e12999bcc24aabfee4ecf2e988bdd8d627c9d3ee98abc7d823192c5f130",
         intel: "bc068139bf389273f4caea2c044c0ce742716139a0e251cf503c7b8207f65d72"

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
