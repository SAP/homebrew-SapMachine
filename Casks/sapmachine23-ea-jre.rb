cask "sapmachine23-ea-jre" do
  version "23,18"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "dacc4615e8b70ef6e16093ae5403fd7b7e8fc93bc8d701db645fa6d04b3f2a9e",
         intel: "31755e4ec9fbfe893feee4b70fb4ca187ab9eaece7aa3d50b6dd2448c83aefa2"

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
