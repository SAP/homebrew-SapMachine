cask "sapmachine24-ea-jdk" do
  version "24,8"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "e2e2390d6b7fbe983a919b7f3ec475137fc4c26ffc29163aa56c1a6ce0666bd2",
         intel: "dee5698a768b7f9993e00f518534e3e4e1b01c7f922f580f3c8e2b3b7ff87cb9"

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
