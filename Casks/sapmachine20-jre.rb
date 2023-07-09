
cask "sapmachine20-jre" do
  version "20.0.1"

  if Hardware::CPU.intel?
    url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jre-#{version}_macos-x64_bin.dmg",
         verified: "https://github.com/SAP/SapMachine"
    sha256 "47bf70c3f553c1b1d674e023f7967646cd09565b4f649a6ad2756c3831c193ca"
  else
    url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jre-#{version}_macos-aarch64_bin.dmg",
         verified: "https://github.com/SAP/SapMachine"
    sha256 "2eec57e1919cc135b1d3020443a091e706476c562d2632e8964b21af3304d1e4"
  end

  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK build from SAP"
  homepage "https://sapmachine.io/"

  artifact "sapmachine-jre-#{version}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jre"

  uninstall rmdir: "/Library/Java/JavaVirtualMachines"
end
