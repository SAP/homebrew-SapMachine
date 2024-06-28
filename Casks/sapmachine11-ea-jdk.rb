cask "sapmachine11-ea-jdk" do
  version "11.0.24,7"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "2c9cc8f2dc9995de3624539fb5b37dff7ebf673e900270842a0cc59e6f721bd0",
         intel: "edc75a04aaa092a9b77e7aef23793b4e54b5e88ea30b98dc5d77ed58cddd3e40"

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
