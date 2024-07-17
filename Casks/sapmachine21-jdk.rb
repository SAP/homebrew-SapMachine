cask "sapmachine21-jdk" do
  version "21.0.4"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "fa2113069d4d48ab8f20a8e9887bfa2e72d987688d8ebec0dae3db5a8e168e40",
         intel: "a2970354f7a8e0ca02db6ad7e2923136401c3389ac2887598a26f5265efcd3fc"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jdk-#{version}_macos-#{arch}_bin.dmg",
      verified: "github.com/SAP/SapMachine/"

  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK distribution from SAP"
  homepage "https://sapmachine.io/"

  # Check for latest version in SapMachine release data.
  livecheck do
    url "https://sap.github.io/SapMachine/assets/data/sapmachine-releases-latest.json"
    regex(/["']tag["']:\s*["']sapmachine[._-]v?(\d+(?:\.\d+)*)["']/i)
  end

  artifact "sapmachine-jdk-#{version}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jdk"
end
