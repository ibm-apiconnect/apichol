# API Connect Hands-On Lab

## Prerequisites

Needless to say you'll need a laptop! It is recommended you use a Mac OS or a ubuntu desktop version laptop. Also make sure you install the following software prior to the session:

You can verify the versions of the required or pre-installed software by running the following commands and ensuring that you have the following versions (or higher).

```
git --version
git version 2.7.4
```

```
cf --version
cf version 6.21.1+6fd3c9f-2016-08-10
```

```
node --version
v4.5.0
```

```
npm --version
3.10.7
```

```
apic --version
API Connect: v5.0.3.0 iFix 2
```


The software can also be installed from

- Git from [http://git-scm.com/downloads](http://git-scm.com/downloads) or "brew install git"

- The `cf` CLI from [https://github.com/cloudfoundry/cli#downloads] (https://github.com/cloudfoundry/cli#downloads) - download the latest version that is appropriate for your laptop and follow the instructions in README.txt. 
<p>
OR 
<p>
from [http://docs.cloudfoundry.org/devguide/installcf/install-go-cli.html](http://docs.cloudfoundry.org/devguide/installcf/install-go-cli.html).

- Install npm - Install `nodejs` from [https://nodejs.org/en/download/](https://nodejs.org/en/download/) which also installs `npm`.

- Install API connect Developer kit - Install API connect Developer Kit after installing `npm` from [https://www.npmjs.com/package/apiconnect] (https://www.npmjs.com/package/apiconnect)

### Sign up for a Bluemix account

- **Sign up for a new account on a Bluemix hosted instance** - It is recommended you create a new account from [https://console.ng.bluemix.net/] (https://console.ng.bluemix.net/) especially if you have not created this account in the last few days.

## Lab software
The software including the instructions is available from [https://github.com/ragsns/apichol] (https://github.com/ragsns/apichol). Install the software locally on your laptop by running the followng command.

```
git clone https://github.com/ragsns/apichol
```

If the lab software has already been installed (you should be able to see a subdirectory named `apichol`) ensure that you have the latest updates by issuing the following command.

```
cd apichol
git pull
```

## Samples and General Directions

Each exercise is in a separate sub-directory. ***Ensure that you're in the sub-directory when you're working on a particular exercise and you're issuing the CLI commands from the subdirectory pertaining to the exercise.***


## Recommended Exercises - User Related

It is recommended that you run through these exercises sequentially since they are progressive with some dependencies. Each exercise should take about 5-10 mins. to complete.


- Exercise 1: [Install Node.js and the API Connect toolkit](exercises/ex1)
- Exercise 2: [Design your OpenAPI Swagger specification](exercises/ex2)
- Exercise 3: [Generate a LoopBack application and import your APIs](exercises/ex3)
- Exercise 4: [Create a database service on Bluemix](exercises/ex4)
- Exercise 5: [Create database CRUD APIs with LoopBack models](exercises/ex5)
- Exercise 6: [Test, Explore and Deploy your LoopBack application](exercises/ex6)
- Exercise 7: [Explore your deployed APIs with the API Manager on Bluemix](exercises/ex7)
- Exercise 8: [Tour A - Create a Weather API using API Connect on Bluemix](exercises/ex8)
- Exercise 9: [Tour B - Generate a Developer Portal for your Weather APIs](exercises/ex9)


## More Resources

Quick tour of API connect at [https://console.ng.bluemix.net/docs/services/apiconnect/index.html] (https://console.ng.bluemix.net/docs/services/apiconnect/index.html)

API Connect Developer Toolkit at [https://www.npmjs.com/package/apiconnect] (https://www.npmjs.com/package/apiconnect)


## Contact

Please contact us at Twitter @ragss or @boilerupnc or @sai_vennam.
