cask "sapmachine17-ea-jdk" do
  version "17.0.15,5"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "d8cf145f47a8aef6bd4e9fc910b8054c2f045aa99c6712ef9f9a70b97a7262a6",
         intel: "5af7989d4dd76b0b4d30e6abd0ec18200b97e1a717e921a232dcef8a5ce6f3ce"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jdk-#{version.before_comma}-ea.#{version.after_comma}_macos-#{arch}_bin.dmg",
      verified: "github.com/SAP/SapMachine/"

  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK distribution from SAP"
  homepage "https://sapmachine.io/"

  # Check for latest version in SapMachine release data.
  livecheck do
    url "https://sap.github.io/SapMachine/assets/data/sapmachine-releases-latest.json"
    regex(/["']tag["']:\s*["']sapmachine[._-]v?(\d+(?:\.\d+)*)["']/i)
  end

  artifact "sapmachine-jdk-#{version.before_comma}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}-ea.jdk"
end
