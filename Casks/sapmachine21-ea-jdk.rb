cask "sapmachine21-ea-jdk" do
  version "21.0.13.0.2,1"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "72da17092633c5cd4a1b0bdbf745af0c69ef347b0ab53e343351d9f394fe9ee2",
         intel: "dbc8b0918b02a6b08737f10f4527a729ac26ac492307004bf3e668cba3b5b588"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jdk-#{version.before_comma}-ea.#{version.after_comma}_macos-#{arch}_bin.dmg"

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
