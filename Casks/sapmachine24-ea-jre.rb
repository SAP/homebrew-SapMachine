cask "sapmachine24-ea-jre" do
  version "24,12"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "8ea1d5e2fb6ff3d9bac657c3a9e1c1bb7cd22083f9bc5fecf6d5caa7a11513ce",
         intel: "bc49cbce6a2ff82b17e97d673a1fba10119a50511e0925c5a02a2eb22156e841"

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
