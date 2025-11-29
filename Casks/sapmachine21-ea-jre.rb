cask "sapmachine21-ea-jre" do
  version "21.0.10,4"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "368bc96d23c878b9ab28a84370d9a5bdc2c9ee9ec5e95278b69ffef4a48e1ded",
         intel: "abf0312fe33907e60dc2d5d8a9067688b2c6a6b0c7297b3153429716be7a111a"

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
