cask "sapmachine11-ea-jre" do
  version "11.0.24,6"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "ab543f565387d2ef1f16374290bedb06ba35b7fde9167cb57a62904816605d0d",
         intel: "658e1867999b7ad3697d9cbc2404e3d9ff0a8136bf9d8bf413381707918087a2"

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
