cask "sapmachine21-ea-jdk" do
  version "21.0.10,4"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "ef27ecaf824c5b6555651524cc5981a0d9e49d5c650966f3bb9b6ba0833ee1aa",
         intel: "1179887b6ae51f2af7ef4cd92d2bc5968e4bdd26e4d90f098f7934a5844d2122"

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
