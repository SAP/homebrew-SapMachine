
cask "sapmachine17-jdk" do
  version "17.0.4"

  if Hardware::CPU.intel?
    url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jdk-#{version}_macos-x64_bin.dmg",
         verified: "https://github.com/SAP/SapMachine"
    sha256 "f7bb3fff11f5b170169c55983a94cf48359b1290242a00ccfd143233a472ce0b"
  else
    url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jdk-#{version}_macos-aarch64_bin.dmg",
         verified: "https://github.com/SAP/SapMachine"
    sha256 "659d7fda2de582ec81cf4ff4b0d595d1004bcce6de4aa7dd04237910005fc0e8"
  end

  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK build from SAP"
  homepage "https://sapmachine.io/"

  artifact "sapmachine-jdk-#{version}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}.jdk"

  uninstall rmdir: "/Library/Java/JavaVirtualMachines"
end
