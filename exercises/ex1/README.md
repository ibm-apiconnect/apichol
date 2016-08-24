#API Connect Hands-On Labs

##Exercise 1: Target the IBM Bluemix instance and create a sample "hello world" API connect project

### Prerequisites

Make sure you've met the following prerequisites.

**Prerequisite 1**: Registered for a Bluemix account that is **still current** (trial Bluemix accounts are available at <http://console.ng.bluemix.net>). Contact the instructor for a promotion code for a bump in the quota. Please note down the `username` (or `email`) and `password` which will be used to login via the `cf` CLI.

**Prerequisite 2**: Installed the Cloud Foundry CLI from <https://github.com/cloudfoundry/cli#downloads>.

**Prerequisite 3**: Installed `npm` and `apic`. Refer to instructions from [https://nodejs.org/en/download/] (https://nodejs.org/en/download/) and [https://www.npmjs.com/package/apiconnect] (https://www.npmjs.com/package/apiconnect) respectively.

**Prerequisite 4**: Installed the Hands-On Labs locally. You can either `git clone` [https://github.com/ragsns/apichol] (https://github.com/ragsns/apichol) or download a zip from the repository.

### Ensure that you are in the right sub-directory

Ensure that you are in sub-directory ex1.

```
cd <path-to-hol-folder>/apichol/exercises/ex1
```

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
cf target -o <your IBM ID> -s dev
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

You can post a note via the following `cURL` command

```
curl -k -X POST https://localhost:4002/api/Messages -H 'X-IBM-Client-Id: default' -H 'X-IBM-Client-Secret: SECRET' -H 'Content-Type: application/json' -H 'Accept: application/json' -d '{ "greeting": "Hello World" }' -v 
```

You should see an output that looks something like below which indicates that a message with an ID of 1 was created.

```
* Closing connection 0
{"id":1,"greeting":"Hello World"}
```

You can retrieve the message via the following command.

```
curl -k --request GET --url 'https://localhost:4002/api/Messages' --header 'accept: application/json' --header 'content-type: application/json' --header 'x-ibm-client-id: default' --header 'x-ibm-client-secret: SECRET'
```

You can explore further by invoking the following command

```
SKIP_LOGIN=true apic edit
```

This will launch the API connect GUI in the default browser. You will have to override the certificates manually for the API connect product in order to invoke the `cURL` commands. For now, feel free to wander around. We will take a more formal guided tour in the subsequent exercise.

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
