#API Connect Hands-On Labs

##Exercise 2: Create a Weather API using API Connect on Bluemix

### Prerequisites

Make sure you've met the following prerequisites.

**Prerequisite 1**: Completed Exercise 1.

### Login to Bluemix and instantiate the API Connect Service

In the previous exercise we looked at how to use loopback framework on the `localhost` which is great for development. In this exercise, we will now look at how to use the API Connect service as a service on Bluemix. The service provides an API connect manager which provides the same tasks that were available via the API Connect GUI locally. 

The service also enables publication of the APIs to a developer portal which will be covered in a subsequent exercise.

Login to Bluemix by providing the credentials that you used during the registration process.

<img src="../../images/ex2/LoginBluemix.tiff"  width="400"> 

Once logged in, click on `Catalog` tab.

<img src="../../images/ex2/BluemixCatalog.tiff"  width="400">

Pick the API Connect service tile

<img src="../../images/ex2/APIConnect.tiff"  width="400">

Pick the defaults for the service

<img src="../../images/ex2/APIConnectService.tiff"  width="400">

You will presented tith a Drafts API screen that looks like below.

<img src="../../images/ex2/DraftsAPI.tiff"  width="400">

Click on "Got it" and proceed.

You will be presented with the Drafts screen that looks like below.

<img src="../../images/ex2/GettingStarted.tiff"  width="400">

If you do not have the "Getting Started" window, click on ? and "Turn on Guided Tour" as shown below.

<img src="../../images/ex2/TurnOnGuidedTour.tiff"  width="400">

We will follow the "Getting Started" tour essentially from now on.

### A tour of the API Connect Manager via the sample Weather API

We start off by clicking on "Import API" in the "Getting Started" window and "Import a Sample API" as prompted.

<img src="../../images/ex2/ImportSample.tiff"  width="400">

In the Dialog box shown below pick the "Climbing Weather" project and hit "Import" as shown below.

<img src="../../images/ex2/ImportSampleDialog.tiff"  width="400">

This will prompt you about the "API Editor" as shown below. Hit "Got it!".

<img src="../../images/ex2/APIEditor.tiff"  width="400">

This will bring up the Design view similar to what you saw earlier, this time on Bluemix.

<img src="../../images/ex2/DesignView.tiff"  width="400">

Scroll down to the `getWeather` method which looks like below.

<img src="../../images/ex2/GetWeather.tiff"  width="400">

Click "Generate and Publish" in the "Getting Started" window picking "Generate a Default Product" as shown below.

<img src="../../images/ex2/GenerateDefaultProduct.tiff"  width="400">

You will see that a default plan will be used and that you will publish the product to the Sandbox catalog. Click on "Generate" as shown below.

<img src="../../images/ex2/GenerateNewProduct.tiff"  width="400">

Next, click "Explore" in the "Getting Started" window as shown below.

<img src="../../images/ex2/Explore.tiff"  width="400">

Pick "Sandbox" as prompted and as whown below.

<img src="../../images/ex2/ExploreSandbox.tiff"  width="400">

You will see the sample API as shown below.

<img src="../../images/ex2/ClimbingWeatherAPI.tiff"  width="400">

We will invoke the API by providing the following APIs to country code and zip. Feel free to substitute values.

<img src="../../images/ex2/CountryZip.tiff"  width="400">

If the call succeeds, you should see a response that looks like below with the weather data for the country and zip code.

<img src="../../images/ex2/RequestResponse.tiff"  width="400">

You can click "Test" on the "Getting Started" window and finally on "Analytics" which should result in something like below.

<img src="../../images/ex2/Analytics.tiff"  width="400">

Which should show the usage statistics for the product.

### Summary of Exercise

We started with the API connect product locally and looked at how to use the same service on Bluemix via the Sample. In a later exercise, we will publish the product to a developer portal that is an adjunct service with the API connect service on Bluemix.
