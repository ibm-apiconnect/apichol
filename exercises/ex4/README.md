#API Connect Hands-On Labs

##Exercise 4: Generate a LoopBack application and import your APIs

### Prerequisites

Make sure you've met the following prerequisites.

**Prerequisite 1**: Registered for a Bluemix account that is **still current** (trial Bluemix accounts are available at <http://console.ng.bluemix.net>). Contact the instructor for a promotion code for a bump in the quota. Please note down the `username` (or `email`) and `password` which will be used to login via the `cf` CLI.

**Prerequisite 2**: Installed the Cloud Foundry CLI from <https://github.com/cloudfoundry/cli#downloads>.

**Prerequisite 3**: Installed `npm` and `apic`. Refer to instructions from [https://nodejs.org/en/download/] (https://nodejs.org/en/download/) and [https://www.npmjs.com/package/apiconnect] (https://www.npmjs.com/package/apiconnect) respectively.

**Prerequisite 4**: Installed the Hands-On Labs locally. You can either `git clone` [https://github.com/ragsns/apichol] (https://github.com/ragsns/apichol) or download a zip from the repository.

### Ensure that you are in the right sub-directory

Ensure that you are in sub-directory ex4.

```
cd <path-to-hol-folder>/apichol/exercises/ex4
```
### Goals

For this exercise, we'll:

1. Learn about how to create a LoopBack application
2. Learn how to consume an OpenAPI specification to empower your LoopBack application

### [LoopBack API](https://console.ng.bluemix.net/docs/services/apiconnect/apic_003.html#apic_009)

Navigate (cd loopback) to the empty loopback folder within the ex4 directory and execute the following command line syntax:

```
apic loopback
```
You'll want to give your application a name and select the **empty-server** option to create an empty LoopBack API.






Next, we'll learn how to easily create a Bluemix MySQL service instance.
