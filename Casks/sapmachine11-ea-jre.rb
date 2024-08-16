cask "sapmachine11-ea-jre" do
  version "11.0.25,3"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "8b0a9bb0d17a7aa66b8f7c954f80c77127b7d072a47c78af591d07ac8951f990",
         intel: "3a077a9aae8f9bdc5eefeab8c9d5270f801027bbccfc48ca193bfaca96d608cc"

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
