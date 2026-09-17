cask "sapmachine17-ea-jdk" do
  version "17.0.21,6"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "04b6c5177a9b43c83bec72c9ae2c4c72c8f0e4a29d8c460165a373f054cd215f",
         intel: "130d4e030e08a4135f966a359f31ba822862e5c029c66ca74028fb19e72d8264"

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
