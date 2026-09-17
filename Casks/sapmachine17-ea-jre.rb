cask "sapmachine17-ea-jre" do
  version "17.0.21,6"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "2e08781c789fa9565e9ce05db6a15d4e7eeb6deba8ce37cf566eaa2a04d3fa7a",
         intel: "44fac88d7a5b4a38e0ed080aab025c7d6da6a7c4a62e3af5586745d50b293ee0"

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
