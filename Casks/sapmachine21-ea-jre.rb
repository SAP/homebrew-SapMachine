cask "sapmachine21-ea-jre" do
  version "21.0.14,2"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "1cc263a94215ee65822208a15da6267029d903f3407d6fcfd3ee078c4ed84474",
         intel: "da75f76a45d7a426ad2fe7e88d6dd2319538b4ec449add0316aa2ab0456bab27"

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
