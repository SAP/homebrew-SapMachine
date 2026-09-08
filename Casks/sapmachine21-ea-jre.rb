cask "sapmachine21-ea-jre" do
  version "21.0.13,5"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "21448f3e4832ec6eedc9d5f9b660026a05055627d355e6c48fdc20c65133ed2e",
         intel: "99a8b1a5759d5bc0afb11be5f67e50f132789f895ad9b3a26e3b51ac791fe1fd"

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
