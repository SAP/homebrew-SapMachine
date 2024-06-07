cask "sapmachine17-ea-jre" do
  version "17.0.12,5"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "ec657fc3b7e9dd320960e903abb2cb49ca8834244a2f2d58ec82e3dd7e00b7a2",
         intel: "dc650bc0cd0fbdbc15a9a0d09b2a4cfa44d534d6fe95f8030b036e266977c19b"

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
