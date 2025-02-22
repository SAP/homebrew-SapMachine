cask "sapmachine21-ea-jdk" do
  version "21.0.7,3"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "9458e9dbd208d4e01d6802ef1e41d96942bfa131723a479e236758c7d5eecc04",
         intel: "b6fa2ba7ca6f7f34f283d6669e4d14fbd3edcb742565d0cf62b2f1a1e22a06a3"

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
