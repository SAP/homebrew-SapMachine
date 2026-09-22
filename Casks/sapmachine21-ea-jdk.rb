cask "sapmachine21-ea-jdk" do
  version "21.0.13,7"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "ac83f3050985c0f70792533e3954560ea0c7c8a7555b5675a77cffe1bd508aee",
         intel: "964b5da2645721b0c4a3526c2d8b848eade150a96d3b26ea96c86d3510dbddd3"

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
