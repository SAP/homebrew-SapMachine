cask "sapmachine21-ea-jdk" do
  version "21.0.14,3"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "f6591b10b4e6c4feb8d81cbb6e89934a0257760bd5c432858b9693cb106f54c5",
         intel: "829063faa564c682e6c7be57d436177aac521d1a4b9d9cd18ec9d433eae76db3"

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
