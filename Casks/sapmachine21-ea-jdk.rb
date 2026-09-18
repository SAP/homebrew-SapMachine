cask "sapmachine21-ea-jdk" do
  version "21.0.13,6"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "4dd3f0c8b23162d3678a660543cebf01b5a68fa79fc417610a4caf07925da073",
         intel: "53f4dcd6c730a31359ef7e5efcc68927317bc39560344aa76b4ff28e66ed57e5"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jdk-#{version.before_comma}-ea.#{version.after_comma}_macos-#{arch}_bin.dmg"

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
