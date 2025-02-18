cask "sapmachine21-ea-jre" do
  version "21.0.7,2"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "096c795a1a10ccd0d9bd0308eeb1f08c31034b7f7efce3697ccfab099dfc38c1",
         intel: "9b7a2e3c7476868cb05aa35a2c9f5d75295c9e07a9f6ce652635071fbf9eedee"

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
