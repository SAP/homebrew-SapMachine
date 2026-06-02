cask "sapmachine17-ea-jre" do
  version "17.0.20,4"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "0742c151efb7dbb2ff4f9eb95a2582bd66f1d6f13396af4f7a93bdb4bef91273",
         intel: "11e8fa4eb2fa83fbb6caa34eccc2fadfa8bb0900ee40def45f9795dee6d3ff6f"

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
