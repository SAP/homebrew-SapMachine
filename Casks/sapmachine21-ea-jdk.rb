cask "sapmachine21-ea-jdk" do
  version "21.0.13,9"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "a034d0369c139ba6f3630f2f137a87d653de11d7ffc648bd8d5c9b2f6150e8c6",
         intel: "edd3cd31b848266b5ec8de5e114edc47978f63311925f313b3cacea3fab8c7fb"

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
