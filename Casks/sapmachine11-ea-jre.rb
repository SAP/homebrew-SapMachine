cask "sapmachine11-ea-jre" do
  version "11.0.25,9"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "c4dfdcfd61e96a5c01b5700f4a3e3cac6df6f367ba1c21d7a56702bdadc9d6e6",
         intel: "61d34f36a74567e5b4bc2667781cc702de13ecf3eab343c026e53cfa4cdafbb4"

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
