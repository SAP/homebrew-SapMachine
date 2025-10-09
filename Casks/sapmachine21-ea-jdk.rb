cask "sapmachine21-ea-jdk" do
  version "21.0.9,9"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "ae7616a59c3f384097d8b2052f0a428bd9c1937553ca9e455db14c55b2efb757",
         intel: "ca606cc42923403bd56cd82cf806e39b50dfccb7bf60ce880ffb3d93d39175f4"

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
