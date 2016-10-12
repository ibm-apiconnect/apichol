#API Connect Hands-On Labs

##Exercise 9: Tour B - Generate a Developer Portal for your APIs

### Prerequisites

Make sure you've met the following prerequisites.

**Prerequisite 1**: Completed Exercise 2 ([Exercise 2](../ex2))

### Overview of exercise

We followed the "Getting Started" tour to use the API Connect manager and invoke the APIs within the API Connect manager. We will pick up from where we left off at the previous exercise. 

In this exercise, we will publish the APIs, with an associated plan and so on to a self-service developer portal which is an adjunct to the Bluemix API Connect service. These APIs can be invoked by any REST-based client.

### Publishing the Sample API to the Developer Portal

Let's head back to the API Connect Manager on IBM Bluemix and to the sandbox that we finished off in exercise 2 as we see below. You can click on the Dashboard tab on the Bluemix console and then on the API connect service as shown below.

<!--<img src="../../images/ex9/DashboardServices.jpeg"  width="400">-->
![](../../images/ex9/DashboardServices.jpeg "")

This will bring up the Dashboard for the API Connect manager as shown below.

<!--<img src="../../images/ex9/SandboxCatalog.jpeg"  width="400">-->
![](../../images/ex9/SandboxCatalog.jpeg "")

Select the "Settings" tab, pick "Portal" and pick the "IBM Developer Portal". Finally click Save icon on the top right as shown below.

<!--<img src="../../images/ex9/DevPortal.jpeg"  width="400">-->
![](../../images/ex9/DevPortal.jpeg "")

Wait for the email to arrive that the developer portal is ready as the dialog box below indicates. **This might take a few minutes.**

<!--<img src="../../images/ex9/DeveloperPortalDialog.jpeg"  width="400">-->
![](../../images/ex9/DeveloperPortalDialog.jpeg "")

Clicking on the link will take you to the developer portal. Reset the password for `admin` as shown below.

<!--<img src="../../images/ex9/ResetPassword.jpeg"  width="400">-->
![](../../images/ex9/ResetPassword.jpeg "")

You will see the "Climbing Weather API" as seen below.

<!--<img src="../../images/ex9/APIProductsClimbingWeatherAPI.jpeg"  width="400">-->
![](../../images/ex9/APIProductsClimbingWeatherAPI.jpeg "")

We will next publish this API to Bluemix.

### Publishing the Sample API to Bluemix

We will go back to the API Connect Manager. If required, re-login to the API Connect Manager as shown below.

<!--<img src="../../images/ex9/APIConnectLogin.jpeg"  width="400">-->
![](../../images/ex9/APIConnectLogin.jpeg "")

In the API Connect Manager on Bluemix click on "Developers" in the navigation pane and "Add Bluemix organization" as shown below.

<!--<img src="../../images/ex9/AddBluemixOrg.jpeg"  width="400">-->
![](../../images/ex9/AddBluemixOrg.jpeg "")

Provide the email address substituting the address with your Bluemix email address as shown below.

<!--<img src="../../images/ex9/AddBlueMixOrgDialog.jpeg"  width="400">-->
![](../../images/ex9/AddBlueMixOrgDialog.jpeg "")

Select the Bluemix org and hit "Confirm" as shown below.

<!--<img src="../../images/ex9/SelectOrgDialog.jpeg"  width="400">-->
![](../../images/ex9/SelectOrgDialog.jpeg "")

Now back in the API Connect Manager click on the "Products" tab and click on "..." tab which should bring up the popup menu as shown below and clik on "Edit visibility".

<!--<img src="../../images/ex9/EditVisibilityMenu.jpeg"  width="400">-->
![](../../images/ex9/EditVisibilityMenu.jpeg "")

Change the visibility to "Custom" and add the organization (substituting your own organization) and Bluemix. Finally hit "Republish" as shown below.

<!--<img src="../../images/ex9/Republish.jpeg"  width="400">-->
![](../../images/ex9/Republish.jpeg "")

The Climbing Weather API product is displayed in the Explore APIs tab of the API Connect Dashboard. If you click, Climbing Weather App 1.0.0 it will take you to the API in the Developer Portal.

### Registering an app for the sample API in the Developer Portal

Back in the Developer Portal logout from admin as shown below.

<!--<img src="../../images/ex9/LogoutAdmin.jpeg"  width="400">-->
![](../../images/ex9/LogoutAdmin.jpeg "")

Click on "Create an account" as shown below.

<!--<img src="../../images/ex9/CreateAnAccount.jpeg"  width="400">-->
![](../../images/ex9/CreateAnAccount.jpeg "")

Complete the form and ensure that you use a different email address.

You should see an account ativation complete as shown below.

<!--<img src="../../images/ex9/AcountActivation.jpeg"  width="400">-->
![](../../images/ex9/AcountActivation.jpeg "")

After the email arrives at this second login with the account details, click on the link which will bring up the portal as below.

<!--<img src="../../images/ex9/UserLogin.jpeg"  width="400">-->
![](../../images/ex9/UserLogin.jpeg "")

Click the API Products and Climbing Weather API. You can see that Climbing Weather API belongs to a default Plan with a rate limit of 100 calls per minute as shown below.

<!--<img src="../../images/ex9/Plans.jpeg"  width="400">-->
![](../../images/ex9/Plans.jpeg "")

Click on the "Climbing Weather API 1.0.0" tab as shown below.

<!--<img src="../../images/ex9/ClimbingWeatherAPIPortal.jpeg"  width="400">-->
![](../../images/ex9/ClimbingWeatherAPIPortal.jpeg "")

Click on the "Apps"navigation pane of the Developer Portal, click "Register a new Application" as shown below.

<!--<img src="../../images/ex9/RegisterNewApplication.jpeg"  width="400">-->
![](../../images/ex9/RegisterNewApplication.jpeg "")

Fill in the details and hit "Submit".

<!--<img src="../../images/ex9/RegisterNewApplicationFilled.jpeg"  width="400">-->
![](../../images/ex9/RegisterNewApplicationFilled.jpeg "")

Click Show to display the "**Client secret**" that we will use subsequently as shown below.

<!--<img src="../../images/ex9/ClientSecret.jpeg"  width="400">-->
![](../../images/ex9/ClientSecret.jpeg "")

Click "API Products" and the "Climbing Weather API" as shown below.

<!--<img src="../../images/ex9/ClimbingWeatherProduct.jpeg"  width="400">-->
![](../../images/ex9/ClimbingWeatherProduct.jpeg "")

The details of the Plan that is named Default Plan are displayed. Click "Subscribe" as shown below.

<!--<img src="../../images/ex9/Subscribe.jpeg"  width="400">-->
![](../../images/ex9/Subscribe.jpeg "")

This will bring up a dialog box. Click on "Subscribe" as shown below.

<!--<img src="../../images/ex9/SubscribeWeatherApp.jpeg"  width="400">-->
![](../../images/ex9/SubscribeWeatherApp.jpeg "")

You have registered to the Climbing Weather App application and subscribed it to a Plan.

### Testing the Climbing Weather API in the Developer Portal

Back in the Developer Portal, In the left navigation pane, click Climbing Weather API. In the "Try this operation" section of the console, ensure that the Weather App application is selected and enter the parameters as shown below including the "Client secret" that was noted from the earlier step and click "Call Operation".

<!--<img src="../../images/ex9/CallingClimbingWeatherAPI.jpeg"  width="400">-->
![](../../images/ex9/CallingClimbingWeatherAPI.jpeg "")

That should provide a response which is shown below.

<!--<img src="../../images/ex9/ClimbingWeatherAPIRequestResponse.jpeg"  width="400">-->
![](../../images/ex9/ClimbingWeatherAPIRequestResponse.jpeg "")

### Summary of exercise and next steps

We started with the API connect product locally in exercise 1 and looked at how to use the same service on Bluemix via the Sample in Exercise 2.

In this exercise, we published the product to a developer portal that is an adjunct service with the API connect service on Bluemix.

You could follow a similar journey to publish your own APIs aroud your own user-generated data. You can use the variety of connectors availble via API Connect.

### Final Summary

In conclusion, we covered the usage of the API Connect Manager locally and on Bluemix, how to create models locally, publish them on Bluemix and explore the APIs.

Finally we published the APIs on a self-service developer portal which provides API-based services including providing service keys, throttling, etc. without having to write any code.

**Congratulations! You are done!!**


