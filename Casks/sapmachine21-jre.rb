cask "sapmachine21-jre" do
  version "21.0.3"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "c1e5b8d4a08713fd490191dbfe46b7531d9470fbb86b755605a1f32ee4ddeab9",
         intel: "42bd41d0c495de48b721271c4166d419b05e1d382f176ff4aac33761716b15c2"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jre-#{version}_macos-#{arch}_bin.dmg",
      verified: "github.com/SAP/SapMachine/"

  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK distribution from SAP"
  homepage "https://sapmachine.io/"

  # Check for latest version in SapMachine release data.
  livecheck do
    url "https://sap.github.io/SapMachine/assets/data/sapmachine-releases-latest.json"
    regex(/["']tag["']:\s*["']sapmachine[._-]v?(\d+(?:\.\d+)*)["']/i)
  end

  artifact "sapmachine-jre-#{version}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jre"
end
