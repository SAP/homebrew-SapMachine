markdown escape curly bracket
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

## Early Access (EA)

| Version | JDK | JRE |
|--|--|--|
| SapMachine 25 Early Access | `sapmachine25-ea-jdk` | `sapmachine25-ea-jre` |

## Released

| Version | JDK | JRE |
|--|--|--|
| SapMachine 24 | `sapmachine24-jdk` | `sapmachine24-jre` |
| SapMachine 21 (LTS) | `sapmachine21-jdk` | `sapmachine21-jre` |
| SapMachine 17 (LTS) | `sapmachine17-jdk` | `sapmachine17-jre` |

LTS - Long Term Support.

Support time windows for SAP;achine releases can be found [here](https://github.com/SAP/SapMachine/wiki/Maintenance-and-Support).

## (Other) Available Versions

Other Versions not listed in this Readme can be found by the pattern `sapmachine<XX>{-ea-}-<jdk|jre>` and can be found in the Casks subfolder. 

## Requirements

Install brew as documented on https://brew.sh/

## Download and Installation

Tap via `brew tap sap/sapmachine`

## How to obtain support

Open an issue in GitHub. Project members will work on them on a best effort base.

## License

Copyright (c) 2019-2021 SAP SE or an SAP affiliate company and homebrew-SapMachine contributors. Please see our [LICENSE](LICENSE) for copyright and license information. Detailed information including third-party components and their licensing/copyright information is available [via the REUSE tool](https://api.reuse.software/info/github.com/SAP/homebrew-SapMachine).
