# HomeBrew Tap for SapMachine

[![REUSE status](https://api.reuse.software/badge/github.com/SAP/homebrew-SapMachine)](https://api.reuse.software/info/github.com/SAP/homebrew-SapMachine)

## How to use it

HomeBrew is a package manager for Mac. You can use it to manage your SapMachine installations.

At first, if you have not already done it, install homebrew:  
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

In case you did not just install it, you should update its contents:  
`brew update`

HomeBrew supports the installation of the latest released SapMachine by default:  
`brew install sapmachine-jdk`

However, you might want to install other versions, such as early access builds of releases/updates currently in development or older versions of a certain Java release, e.g. SapMachine 11 LTS. For this you can use this tap.

Tap it via:  
`brew tap sap/sapmachine`

Then you can install SapMachines, picking `<version>` from the list below:  
`brew install <version>`

## Available versions

| Version | JDK | JRE |
|--|--|--|
| SapMachine 21 Early Access | `sapmachine21-ea-jdk` | `sapmachine21-ea-jre` |
| SapMachine 20 Early Access | `sapmachine20-ea-jdk` | `sapmachine20-ea-jre` |
| SapMachine 19 Released | `sapmachine19-jdk` | `sapmachine19-jre` |
| SapMachine 17 Released | `sapmachine17-jdk` | `sapmachine17-jre` |
| SapMachine 17 Early Access | `sapmachine17-ea-jdk` | `sapmachine17-ea-jre` |
| SapMachine 11 Released | `sapmachine11-jdk` | `sapmachine11-jre` |
| SapMachine 11 Early Access | `sapmachine11-ea-jdk` | `sapmachine11-ea-jre` |

## Requirements

Install brew as documented on https://brew.sh/

## Download and Installation

Tap via `brew tap sap/sapmachine`

## How to obtain support

Open an issue in GitHub. Project members will work on them on a best effort base.

## License

Copyright (c) 2019-2021 SAP SE or an SAP affiliate company and homebrew-SapMachine contributors. Please see our [LICENSE](LICENSE) for copyright and license information. Detailed information including third-party components and their licensing/copyright information is available [via the REUSE tool](https://api.reuse.software/info/github.com/SAP/homebrew-SapMachine).
