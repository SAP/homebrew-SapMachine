cask "sapmachine21-jdk" do
  version "21.0.13.0.2"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "c91c1a0be0e38be89003407ce04fc45a1a4c3270280936a3f9d009470bb3f7d6",
         intel: "2635f33e79be5d162d28cdab8a261d282da7156fe23fbf676ade17401daa8943"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jdk-#{version}_macos-#{arch}_bin.dmg"

  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK distribution from SAP"
  homepage "https://sapmachine.io/"

  # Check for latest version in SapMachine release data.
  livecheck do
    url "https://sap.github.io/SapMachine/assets/data/sapmachine-releases-latest.json"
    regex(/["']tag["']:\s*["']sapmachine[._-]v?(\d+(?:\.\d+)*)["']/i)
  end

  artifact "sapmachine-jdk-#{version}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jdk"
end
