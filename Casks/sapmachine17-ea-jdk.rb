cask "sapmachine17-ea-jdk" do
  version "17.0.10,5"
  arch arm: "aarch64", intel: "x64"
  sha256 arm:   "723d619451f9a6c24ab8db1bc3b639d4a4d07fbe0fe9027871bfa5c11407ad4c",
         intel: "af2d405ce02a767134cb0222c338d6a3e77ac173efa3a374032ad3760aa90c17"

  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version.before_comma}%2B#{version.after_comma}/sapmachine-jdk-#{version.before_comma}-ea.#{version.after_comma}_macos-#{arch}_bin.dmg",
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

  artifact "sapmachine-jdk-#{version.before_comma}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-#{version.major}-ea.jdk"
end
