cask "sapmachine17-ea-jdk" do
  version "17.0.19,1"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "b21629c627c3eecf4c5ce185c6c2caec91e9dc3b2e71b3932af8ff1fd5daf0ba",
         intel: "d0d53ec19b318ee8e5217039dfd0a700b43d7fa64639540f77369f2dd941de6d"

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
