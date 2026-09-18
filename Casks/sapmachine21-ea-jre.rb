cask "sapmachine21-ea-jre" do
  version "21.0.13,6"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "ac803706f55df116bc5c948b68e9fd8baae94670f1657a6db2ffb6fe65aa2b9f",
         intel: "e1c7ecdf5110b0b76ef466075c0c92138621aca624305a54e60f2eab2120da37"

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
