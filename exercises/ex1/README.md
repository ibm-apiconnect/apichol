#API Connect Hands-On Labs

##Exercise 1: Install Node.js, API Connect Toolkit, target a Bluemix instance and create a sample "hello world" API connect project

### Prerequisites

It is recommended you use a Mac OS or a ubuntu desktop version laptop. Also make sure to install the following software prior to the session:

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


The software can also be installed (if you Bring Your Own Laptop) from

- Git from [http://git-scm.com/downloads](http://git-scm.com/downloads) or "brew install git"

- The `cf` CLI from [https://github.com/cloudfoundry/cli#downloads] (https://github.com/cloudfoundry/cli#downloads) - download the latest version that is appropriate for your laptop and follow the instructions in README.txt.
<p>
OR
<p>
from [http://docs.cloudfoundry.org/devguide/installcf/install-go-cli.html](http://docs.cloudfoundry.org/devguide/installcf/install-go-cli.html).

- Install npm - Install `nodejs` from [https://nodejs.org/en/download/](https://nodejs.org/en/download/) which also installs `npm`.

- Install API connect Developer kit - Install API connect Developer Kit after installing `npm` from [https://www.npmjs.com/package/apiconnect] (https://www.npmjs.com/package/apiconnect)

###Sign up for a Bluemix account

**Sign up for a new account on a Bluemix hosted instance** - It is recommended you create a new account from [https://console.ng.bluemix.net/] (https://console.ng.bluemix.net/) especially if you have not created this account in the last few days.

##Lab software
The software including the instructions is available from [https://github.com/ragsns/apichol] (https://github.com/ragsns/apichol). Install the software locally on your laptop by running the followng command.

```
git clone https://github.com/ragsns/apichol
```

If the lab software has already been installed (you should be able to see a subdirectory named `apichol`) ensure that you have the latest updates by issuing the following command.

```
cd apichol
git pull
```

### Ensure that you are in the right sub-directory

Ensure that you are in sub-directory ex1.

```
cd <path-to-hol-folder>/exercises/ex1
```

### Overview of exercise

In this exercise, we will target a Bluemix Cloud Foundry instance using the Bluemix ID you created and invoke the API Connect service locally.

### Target the Bluemix instance

Target the Bluemix Cloud Foundry instance by substituting the URL with the one provided and use the following command. 

```
cf api https://api.ng.bluemix.net # to Americas
```
**OR**

```
cf api https://api.eu-gb.bluemix.net # to Europe
```


The output for the `cf` CLI should look something like below.

```
Setting api endpoint to https://api.ng.bluemix.net...
OK

                   
API endpoint:   https://api.ng.bluemix.net (API version: 2.27.0)   
Not logged in. Use 'cf login' to log in.  
```

Login to the instance as directed.

```
cf login
```

Substitute the **non-expired** Bluemix account that was created earlier as below.

```
API endpoint: https://api.ng.bluemix.net

Email> <your IBM ID>

Password> 
Authenticating...
OK

Targeted org raghsrin@us.ibm.com

Targeted space dev


                   
API endpoint:   https://api.ng.bluemix.net (API version: 2.27.0)   
User:           raghsrin@us.ibm.com   
Org:            raghsrin@us.ibm.com   
Space:          dev
```


List the spaces with the following command

```
cf spaces
```

The output will look something line below.

```
Getting spaces in org raghsrin@us.ibm.com as raghsrin@us.ibm.com...

name   
dev
```

If there are no space(s) listed, then create a space `dev` with the following command.

```
cf create-space dev
```

The output will look something like below.

```
Creating space dev in org raghsrin@us.ibm.com as raghsrin@us.ibm.com...
OK
Assigning role SpaceManager to user raghsrin@us.ibm.com in org raghsrin@us.ibm.com / space dev as raghsrin@us.ibm.com...
OK
Assigning role SpaceDeveloper to user raghsrin@us.ibm.com in org raghsrin@us.ibm.com / space dev as raghsrin@us.ibm.com...
OK

TIP: Use 'cf target -o raghsrin@us.ibm.com -s dev' to target new space
```

Issue the command as provided in `TIP` above as below to target the newly created space (if required).

```
cf target -o <your IBM ID at signup> -s dev
```

The output will look something like below.

```
API endpoint:   https://api.ng.bluemix.net (API version: 2.27.0)   
User:           raghsrin@us.ibm.com   
Org:            raghsrin@us.ibm.com   
Space:          dev  
```

List the apps by issuing the following command.

```
cf apps
```

The output will look something like below.

```
Getting apps in org raghsrin@us.ibm.com / space dev as raghsrin@us.ibm.com...
OK

No apps found
```

Next we will create a simple `hello-world` project using API Connect.

### Create a "hello world" API connect project

Create a Loopback application. Pick the defaults except as noted below.

```
apic loopback --name notes
```

Pick the defaults except for the sample application notes instead of the default option.

```
? What kind of application do you have in mind? notes (A project containing a basic working example, including a memor
y database)
```

Change to the project directory

```
cd notes
```

Start the API connect services locally

```
apic start
```

Ensure the service is running via the command

```
curl -l localhost:4001
```

Which should display how long the service has been running

You can try other options as available in the following command

```
apic --help
```

You can explore further by invoking the following command

```
SKIP_LOGIN=true apic edit
```

This will launch the API connect GUI in the default browser. You will have to override the certificates manually. For now, feel free to wander around. We will take a more formal guided tour in the subsequent exercise.

Finally, you can stop the service as below.

```
apic stop
```

Which should show the service being stopped.

You can clean up by deleting the sub-directory if you prefer.

```
cd ..
rm -rf notes
```

We will dive into API Connect in the subsequent exercises.

### Summary of exercise and next steps

After installing all the prerequisites, we explored how to target a Bluemix/Cloud Foundry instance and use the API connect product locally.

In [Exercise 2](../ex2) we will look at how to use the OpenAPI specification (swagger) editor.

