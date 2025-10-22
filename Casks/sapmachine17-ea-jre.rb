cask "sapmachine17-ea-jre" do
  version "17.0.17,10"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "351ab021b7bf33564c545235096d74a7c6b46ce4cdf3a3582b33cf8755dbc2ee",
         intel: "7584e9ed5ee0688667c33d1a79b8dfa558c2c397a41f37dc31d36cf0f24ccb64"

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
