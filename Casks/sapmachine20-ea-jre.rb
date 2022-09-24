
cask "sapmachine20-ea-jre" do
  version "20,16"

  if Hardware::CPU.intel?
    url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jre-#{version.before_comma}-ea.#{version.after_comma}_macos-x64_bin.dmg",
         verified: "https://github.com/SAP/SapMachine"
    sha256 "5d90de788d47c965446493234d2e9379484acce70ceaf2ff28e88c14cd69bed7"
  else
    url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jre-#{version.before_comma}-ea.#{version.after_comma}_macos-aarch64_bin.dmg",
         verified: "https://github.com/SAP/SapMachine"
    sha256 "90987e87a09148ecd515c0c01f0a401b1d0d8c1887a944b27e5962acb97cc6c3"
  end

  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK build from SAP"
  homepage "https://sapmachine.io/"

  artifact "sapmachine-jre-#{version.before_comma}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}-ea.jre"

  uninstall rmdir: "/Library/Java/JavaVirtualMachines"
end
