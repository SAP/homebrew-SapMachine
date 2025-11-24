cask "sapmachine21-ea-jdk" do
  version "21.0.10,3"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "6a0636f9a1ee8c7d2b66a3ba2058a624e0627e9f5aa55ced30dd108cdb9ade61",
         intel: "cc0b13013ccc866e0dbd74e8249f7b68bd30d7682a3274c64dd3b28c43140cfd"

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
