cask "sapmachine21-ea-jre" do
  version "21.0.13.0.2,1"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "da56db2a67efd32839b0d477ec498869c75daaf58f48bc701a749350e3fbb3cd",
         intel: "5feeee6b0dcc0c77fadaca80001610584b2f72ec2c05c920255860c17a83207a"

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
