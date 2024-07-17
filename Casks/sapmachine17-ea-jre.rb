cask "sapmachine17-ea-jre" do
  version "17.0.12,7"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "0f0f021dd8bbc83e4eac8356b8506c18140096a8a88ffe0ad7c3b1a4f1f4b626",
         intel: "d525b5cc6b6edf048beeb89b48377293e5b4d1e1d5e32a8d86b30e5d66479191"

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
