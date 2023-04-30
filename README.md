<p align="center">
  <img alt="kspacr Logo" src="https://kspacr.com/images/kspacr_slogan.png" width="600"/>
</p>

[kspacr](https://kspacr.com) provides Kubernetes Namespaces and Virtual Clusters without the overhead of a full cluster. 
Our Zero-Ops Kubernetes platform enables and fast and secure Self-Service for Developers.

Use the kspacr CLI (Command Line Interface) to manage your Serverless Kubernetes resources from your terminal.

## Installation

### MacOS

Install the latest version of the kspacr CLI on macOS using [Homebrew](http://brew.sh/):

```shell
brew install kspacr/tap/kspacr
```

### Windows

Install the latest version of the kspacr CLI on Windows using [Scoop](https://scoop.sh/):

```shell
scoop install kspacr
```

### Install Script

Install the latest version on MacOS, Linux and WSL using the install script:

```shell
curl -L https://kspacr.com/install.sh | sh
```

### Download from GitHub

The CLI can be installed from pre-compiled binaries for macOS (darwin), Linux and Windows. You can download the appropriate 
version from the [Releases](https://github.com/kspacr/kspacr-cli/releases) page.

## Getting started

### Initial configuration

Generate an [API token](https://app.kspacr.com/user/api-tokens) and run `kspacr auth login` to add the token to your configuration file.

```shell
$ kspacr auth login
Enter your kspacr API token ( https://app.kspacr.com/user/api-tokens ): █***********
== Setting API token in /Users/johndoe/.kspacr/config.yaml
```

You can also use the environment variable `KSPACR_API_TOKEN` to set up your API token.
