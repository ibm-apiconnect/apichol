# API Connect Hands-On Labs

## Exercise 8: Explore your deployed APIs with the API Manager on Bluemix

### Prerequisites

To run through this exercise, you will need to have done the following steps:

**Prerequisite 1** Installed the API Connect toolkit ([Exercise 1](../ex1))

**Prerequisite 2** Generated a LoopBack app ([Exercise 4](../ex4))

**Prerequisite 3** Created a database service on Bluemix and connected it to your LoopBack app ([Exercise 5](../ex5))

**Prerequisite 4** Created database CRUD APIs in the API Designer ([Exercise 6](../ex6))

**Prerequisite 5** Deployed your LoopBack application to Bluemix ([Exercise 7](../ex7))

### Accessing your deployed APIs

In exercise 7, you tested your APIs locally and deployed them to Bluemix. To see where you deployed the APIs, we'll access the API Manager you used in exercise 2.

Navigate to Bluemix: https://new-console.ng.bluemix.net and ensure you are logged in. Choose APIs using the drop-down at the top, and select your API Connect service. This launches the API Manager.

Let's explore the APIs you just pushed. Hit the `Explore` button on the top right, and choose the `Sandbox` catalog. This takes us to a view similar to the `Explore` view on the API Designer that we used in [Exercise 7](../ex7). The main difference is that this time, we are testing these APIs hosted by an application on Bluemix.

On the left, click on the app you just pushed, which is the name of your LoopBack application created earlier.

<img src="SS1.png"  width="300">

In this view, we can explore all the APIs in the chosen catalog.

#### GET /Employees

Navigate to the operation `GET /Employees`. Along the right side, there is a black section which shows you how to call that operation, shows a sample response, and has a button "Call Operation". Hit the button to call your GET operation.

This should return a list of the employees in the database.

#### POST /Employees

Navigate to the operation `POST /Employees` to create a database entry. Scroll down to the "Call Operation" button, enter some data into the Paramters section (or use the `Generate` button), and hit call Operation.

You should see a `200 OK` response, as well as a response body indicating that the database update has succeeded. You can now call the `GET /Employees` operation again to see the employee entry you just created.

### Next steps

In the next exercises, we'll create a developer portal so others can consume your APIs.

Next up, Exercise 9: [Generate a Developer Portal for your APIs](../exercises/ex9)