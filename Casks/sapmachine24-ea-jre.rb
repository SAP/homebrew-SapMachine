cask "sapmachine24-ea-jre" do
  version "24.0.2,12"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "ffdac803ece4c16322dd6ad95ce23b88c37641ba1d8b48268789cd55d9cffca7",
         intel: "73ed8eb99168f17367697c7c6c2ebc3f67c36e42e67e306385d43e7d9f480731"

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
