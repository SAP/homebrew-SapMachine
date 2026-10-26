cask "sapmachine21-ea-jre" do
  version "21.0.13.0.3,1"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "6df42e25ca3a50a1d65d90bfcf1d3a40c8f48512cf0dd8063274f4dec2a69de9",
         intel: "d9710dcbc84307e4d4a5f61dde39d6db400dae07828e02b4cc3203a7f2ceaab4"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jre-#{version.before_comma}-ea.#{version.after_comma}_macos-#{arch}_bin.dmg"

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
