# SapMachine HomeBrew TAP

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

Then you can install SAPMachines, picking `<version>` from the list below:  
`brew cask install <version>`

## Known issues / Outlook

Updating the casks is not yet integrated into our build processes. So you might run into outdated casks from time to time. In case you encounter such, just drop us a mail (<sapmachine@sap.com>) or open a PR against this repository :)

## Available versions

| Version | JDK | JRE |
|--|--|--|
| SapMachine 13 Early Access | `sapmachine13-ea-jdk` | `sapmachine13-ea-jre` |
| SapMachine 12 Released | `sapmachine12-jdk` | `sapmachine12-jre` |
| SapMachine 12 Early Access | `sapmachine12-ea-jdk` | `sapmachine12-ea-jre` |
| SapMachine 11 Released | `sapmachine11-jdk` | `sapmachine11-jre` |
| SapMachine 11 Early Access | `sapmachine11-ea-jdk` | `sapmachine11-ea-jre` |

## License

Copyright (c) 2019 SAP SE or an SAP affiliate company. All rights reserved.  
This file is licensed under the [Apache Software License, v. 2](https://github.com/SAP/homebrew-SapMachine/blob/master/LICENSE)
