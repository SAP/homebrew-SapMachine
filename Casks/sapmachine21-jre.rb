cask "sapmachine21-jre" do
  version "21.0.12"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "c2993f7bb816f3f2e41693c1517b7e4c0e3e170d239d8a4a87ac1ec7ba15338a",
         intel: "4a8675c4ceda392add0def1797ed58f13fcdd38a6585e29b1fea9f83eded01c1"

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
