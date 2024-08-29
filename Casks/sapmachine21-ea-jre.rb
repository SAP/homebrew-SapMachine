cask "sapmachine21-ea-jre" do
  version "21.0.5,4"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "8dcd3a62b94876f5e54094c1eaebbefb3330c3b2b9d65fc0fbdc94d8ec0ff9e1",
         intel: "71f95b06a1014720d971a047e6d94f9dec94433ae8909c3cce2fcfdc5329cf0a"

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
