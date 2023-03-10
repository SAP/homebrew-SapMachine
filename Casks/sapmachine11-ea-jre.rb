
cask "sapmachine11-ea-jre" do
  version "11.0.19,5"

  if Hardware::CPU.intel?
    url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jre-#{version.before_comma}-ea.#{version.after_comma}_macos-x64_bin.dmg",
         verified: "https://github.com/SAP/SapMachine"
    sha256 "ec5186104078cbb6f2416d9d1573b2411e0ac493d5a8a1e73ed2f0fa65f700a6"
  else
    url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jre-#{version.before_comma}-ea.#{version.after_comma}_macos-aarch64_bin.dmg",
         verified: "https://github.com/SAP/SapMachine"
    sha256 "a28c54ecad188b2003275df328131008340b97aed86bbd7daa3b0da8671ac635"
  end

  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name "SapMachine OpenJDK Development Kit"
  desc "OpenJDK build from SAP"
  homepage "https://sapmachine.io/"

  artifact "sapmachine-jre-#{version.before_comma}.jre", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}-ea.jre"

  uninstall rmdir: "/Library/Java/JavaVirtualMachines"
end
