<p align="center">
  <img alt="kspacr Logo" src="https://kspacr.com/assets/images/kspacr_slogan.png" width="600"/>
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

Install the latest version of the kspacr CLI on Windows ...

using PowerShell (Windows):

```shell
iwr https://kspacr.com/install.ps1 -useb | iex
```

using [Scoop](https://scoop.sh/):

```shell
scoop bucket add kspacr https://github.com/kspacr/scoop-kspacr-cli.git
scoop install kspacr/kspacr
```

### Install Script

Install the latest version on MacOS, Linux and WSL using the install script:

```shell
curl -L https://kspacr.com/install.sh | sh
```

### Download from GitHub

The CLI can be installed from pre-compiled binaries for macOS (darwin), Linux and Windows. You can download the appropriate version from the [Releases](https://github.com/kspacr/kspacr-cli/releases) page.

## Getting started

### Initial configuration

Run `kspacr auth login` to log into your kspacr account and update the local kspacr configuration file.

```shell
$ kspacr auth login
Your email: john.doe@example.com
Your Password: ********
```

You can also use the environment variable `KSPACR_API_TOKEN` to set up your API token.

## Namespaces

### Get available Namespaces

Get a list of all namespaces available for your currently active team:

```shell
kspacr ns list
```

### Connect to Namespace

Fetch kubeconfig context to connect to Kubernetes cluster hosting your namespace. This will allow to select an available namespacesand merges the context into your kubeconfig:

```shell
kspacr ns connect
```

Fetch context without merging into your kubeconfig:

```shell
kspacr ns connect --no-merge
```

Fetch context for given namespace and merge with given kubeconfig:

```shell
kspacr ns connect -n my-name-space -k /home/johndoe/.kube/my-config
```
