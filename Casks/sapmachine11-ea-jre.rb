cask "sapmachine11-ea-jre" do
  version "11.0.25,1"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "3cece325796e4ef435c28483de9bc0543e9665aa9b0dc9ca3e97887eb3e995b0",
         intel: "7385e74bde54b5bc8f8fbfc3d93f2ae72c338d10fbad9ca1a9be63e6ff8f6345"

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
