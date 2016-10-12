#API Connect Hands-On Labs

##Exercise 8: Tour A - Create a Weather API using API Connect on Bluemix

### Prerequisites

**Prerequisite 1**: Installed the API Connect toolkit ([Exercise 1](../ex1)).

### Overview of exercise

In this exercise, we will now look at how to use the API Connect service as a service on Bluemix. The service provides an API connect manager which provides the same tasks that were available via the API Connect GUI locally, but on the cloud. We will primarily follow the "Getting Started Tour" in this and the following exercise.

The service also enables publication of the APIs to a developer portal which will be covered in the subsequent exercise.

### Login to Bluemix and instantiate the API Connect Service

Login to Bluemix by providing the credentials that you used during the registration process.

<!--<img src="../../images/ex8/LoginBluemix.jpeg"  width="400">-->
![](../../images/ex8/LoginBluemix.jpeg "")

Once logged in, click on `Catalog` tab.

<!--<img src="../../images/ex8/BluemixCatalog.jpeg"  width="400">-->
![](../../images/ex8/BluemixCatalog.jpeg "")

Pick the API Connect service tile

<!--<img src="../../images/ex8/APIConnect.jpeg"  width="400">-->
![](../../images/ex8/APIConnect.jpeg "")

Pick the defaults for the service

<!--<img src="../../images/ex8/APIConnectService.jpeg"  width="400">-->
![](../../images/ex8/APIConnectService.jpeg "")

You will presented tith a Drafts API screen that looks like below.

<!--<img src="../../images/ex8/DraftsAPI.jpeg"  width="400">-->
![](../../images/ex8/DraftsAPI.jpeg "")

Click on "Got it" and proceed.

You will be presented with the Drafts screen that looks like below with the `Getting Started` window on the top right as shown below.

<!--<img src="../../images/ex8/GettingStarted.jpeg"  width="400">-->
![](../../images/ex8/GettingStarted.jpeg "")

If you do not see the "Getting Started" window at any time, **click on ? and "Turn on Guided Tour"** as shown below.

<!--<img src="../../images/ex8/TurnOnGuidedTour.jpeg"  width="400">-->
![](../../images/ex8/TurnOnGuidedTour.jpeg "")

We will follow the "Getting Started" tour essentially from now on.

### A tour of the API Connect Manager via the sample Weather API

We start off by clicking on "Import API" in the "Getting Started" window and "Import a Sample API" as prompted.

As indicated before, if you do not have the `Getting Started` window on top right, **click on ? and "Turn on Guided Tour"**

<!--<img src="../../images/ex8/ImportSample.jpeg"  width="400">-->
![](../../images/ex8/ImportSample.jpeg "")

In the Dialog box shown below pick the "Climbing Weather" project and hit "Import" as shown below.

<!--<img src="../../images/ex8/ImportSampleDialog.jpeg"  width="400">-->
![](../../images/ex8/ImportSampleDialog.jpeg "")

This will prompt you about the "API Editor" as shown below. Hit "Got it!".

<!--<img src="../../images/ex8/APIEditor.jpeg"  width="400">-->
![](../../images/ex8/APIEditor.jpeg "")

This will bring up the Design view similar to what you saw earlier, this time on Bluemix.

<!--<img src="../../images/ex8/DesignView.jpeg"  width="400">-->
![](../../images/ex8/DesignView.jpeg "")

Scroll down to the `getWeather` method which looks like below.

<!--<img src="../../images/ex8/GetWeather.jpeg"  width="400">-->
![](../../images/ex8/GetWeather.jpeg "")

Click "Generate and Publish" in the "Getting Started" window picking "Generate a Default Product" as shown below.

<!--<img src="../../images/ex8/GenerateDefaultProduct.jpeg"  width="400">-->
![](../../images/ex8/GenerateDefaultProduct.jpeg "")

You will see that a default plan will be used and that you will publish the product to the Sandbox catalog. Click on "Generate" as shown below.

<!--<img src="../../images/ex8/GenerateNewProduct.jpeg"  width="400">-->
![](../../images/ex8/GenerateNewProduct.jpeg "")

Next, click "Explore" in the "Getting Started" window as shown below.

<!--<img src="../../images/ex8/Explore.jpeg"  width="400">-->
![](../../images/ex8/Explore.jpeg "")

Pick "Sandbox" as prompted and as whown below.

<!--<img src="../../images/ex8/ExploreSandbox.jpeg"  width="400">-->
![](../../images/ex8/ExploreSandbox.jpeg "")

You will see the sample API as shown below.

<!--<img src="../../images/ex8/ClimbingWeatherAPI.jpeg"  width="400">-->
![](../../images/ex8/ClimbingWeatherAPI.jpeg "")

We will invoke the API by providing the following APIs to country code and zip. Feel free to substitute values.

<!--<img src="../../images/ex8/CountryZip.jpeg"  width="400">-->
![](../../images/ex8/CountryZip.jpeg "")

If the call succeeds, you should see a response that looks like below with the weather data for the country and zip code.

<!--<img src="../../images/ex8/RequestResponse.jpeg"  width="400">-->
![](../../images/ex8/RequestResponse.jpeg "")

If the call fails as shown below, click on the link and accept the certificates (we're overriding the Cross-Origin Resource Sharing - CORS error)

The following screen shots walks through how to ovveride this via a series of dialog boxes. This might be different based on the browser, the URL and the error but is illustrated below

<!--<img src="../../images/ex8/CORSError.jpeg"  width="400">-->
![](../../images/ex8/CORSError.jpeg "")

![](../../images/ex8/CORSError2.jpeg "")
![](../../images/ex8/ConnectionNotSecure.jpeg "")
![](../../images/ex8/ConnectionInSecure.jpeg "")
![](../../images/ex8/ConfirmSecurityException.jpeg "")


You can click "Test" on the "Getting Started" window and finally on "Analytics" which should result in something like below.

<!--<img src="../../images/ex8/Analytics.jpeg"  width="400">-->
![](../../images/ex8/Analytics.jpeg "")

Which should show the usage statistics for the product.

### Summary of exercise and next steps

We started with the API connect product locally in an exercise and looked at how to use the same service on Bluemix via the Sample. In a later exercise, we will publish the product to a developer portal that is an adjunct service with the API connect service on Bluemix.

In the next exercises, we'll create a developer portal so others can consume your APIs.

Next up, Exercise 9: [Generate a Developer Portal for your APIs](../ex9)
