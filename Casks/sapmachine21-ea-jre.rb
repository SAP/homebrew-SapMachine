cask "sapmachine21-ea-jre" do
  version "21,33"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "b402b879f84886e27f7d68ba124b3cbe51d18b04703cd82750b24eb47f4573c7",
         intel: "9959a8613c834e79dd0f3a7f2be1a8b2eeb5f57446f3cce6118167946aae504b"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jre-#{version.before_comma}-ea.#{version.after_comma}_macos-#{arch}_bin.dmg",
      verified: "github.com/SAP/SapMachine/"

  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK distribution from SAP"
  homepage "https://sapmachine.io/"

  # The version information on the homepage is rendered client-side from the
  # following JSON file, so we have to check it instead.
  livecheck do
    url "https://sap.github.io/SapMachine/assets/data/sapmachine_releases.json"
    regex(/["']tag["']:\s*["']sapmachine[._-]v?(\d+(?:\.\d+)*)["']/i)
  end

  artifact "sapmachine-jre-#{version.before_comma}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}-ea.jre"
end
