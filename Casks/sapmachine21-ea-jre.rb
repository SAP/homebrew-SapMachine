cask "sapmachine21-ea-jre" do
  version "21.0.14,1"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "277601ed9ae5ca173e20bd7b2d0bf86e93f5bcfbf3af3dece240193bba24d08f",
         intel: "21e603c32ff6bca32cbfc2b9ef34373654e6bbe5377e1977bcf4585581c98781"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jre-#{version.before_comma}-ea.#{version.after_comma}_macos-#{arch}_bin.dmg"

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
