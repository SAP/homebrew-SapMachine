cask "sapmachine24-ea-jre" do
  version "24,14"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "2314839b1a97d039f19f07deba1172e22160c957a20f79c9a15dfa41519270ab",
         intel: "150b0873ef03b228b0fe224782a17b59f468727c70bddb9f19b9a3db0bf38624"

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
