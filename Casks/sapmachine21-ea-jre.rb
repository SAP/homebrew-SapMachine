cask "sapmachine21-ea-jre" do
  version "21.0.4,2"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "40cc0dbd8cd6eaf92dbb13ff0f29f63f2b12332dfcafd4cc1961e495db7c54c3",
         intel: "8c680d36fd3d193b6136cf06af777fc23a99c829ac9b24e513c8a245a6065575"

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
