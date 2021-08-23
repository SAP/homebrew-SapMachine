# HomeBrew Tap for SapMachine

[![REUSE status](https://api.reuse.software/badge/github.com/SAP/homebrew-SapMachine)](https://api.reuse.software/info/github.com/SAP/homebrew-SapMachine)

## How to use it

HomeBrew is a package manager for Mac. You can use it to manage your SapMachine installations.

At first, if you have not already done it, install homebrew:  
`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

In case you did not just install it, you should update its contents:  
`brew update`

HomeBrew supports the installation of the latest released SapMachine by default:  
`brew cask install sapmachine-jdk`

However, you might want to install other versions, such as early access builds of releases/updates currently in development or older versions of a certain Java release, e.g. SapMachine 11 LTS. For this you can use this tap.

Tap it via:  
`brew tap sap/sapmachine`

Then you can install SapMachines, picking `<version>` from the list below:  
`brew cask install <version>`

## Available versions

| Version | JDK | JRE |
|--|--|--|
| SapMachine 16 Early Access | `sapmachine16-ea-jdk` | `sapmachine16-ea-jre` |
| SapMachine 15 Released | `sapmachine15-jdk` | `sapmachine15-jre` |
| SapMachine 15 Early Access | `sapmachine15-ea-jdk` | `sapmachine15-ea-jre` |
| SapMachine 13 Released | `sapmachine14-jdk` | `sapmachine14-jre` |
| SapMachine 13 Early Access | `sapmachine14-ea-jdk` | `sapmachine14-ea-jre` |
| SapMachine 13 Released | `sapmachine13-jdk` | `sapmachine13-jre` |
| SapMachine 13 Early Access | `sapmachine13-ea-jdk` | `sapmachine13-ea-jre` |
| SapMachine 12 Released | `sapmachine12-jdk` | `sapmachine12-jre` |
| SapMachine 12 Early Access | `sapmachine12-ea-jdk` | `sapmachine12-ea-jre` |
| SapMachine 11 Released | `sapmachine11-jdk` | `sapmachine11-jre` |
| SapMachine 11 Early Access | `sapmachine11-ea-jdk` | `sapmachine11-ea-jre` |

## License

Copyright (c) 2019-2021 SAP SE or an SAP affiliate company and homebrew-SapMachine contributors. Please see our [LICENSE](LICENSE) for copyright and license information. Detailed information including third-party components and their licensing/copyright information is available [via the REUSE tool](https://api.reuse.software/info/github.com/SAP/homebrew-SapMachine).
