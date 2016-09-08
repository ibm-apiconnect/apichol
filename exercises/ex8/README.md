# API Connect Hands-On Labs

## Exercise 8: Explore your deployed APIs with the API Manager on Bluemix

### Prerequisites

To run through this exercise, you will need to have done the following steps:

**Prerequisite 1** Installed the API Connect toolkit ([Exercise 1](../exercises/ex1))

**Prerequisite 2** Generated a LoopBack app ([Exercise 4](../exercises/ex4))

**Prerequisite 3** Created a database service on Bluemix and connected it to your LoopBack app ([Exercise 5](../exercises/ex5))

**Prerequisite 4** Created database CRUD APIs in the API Designer ([Exercise 6](../exercises/ex6))

**Prerequisite 5** Deployed your LoopBack application to Bluemix ([Exercise 7](../exercises/ex7))

### Accessing your deployed APIs

In exercise 7, you tested your APIs locally and deployed them to Bluemix. To see where you deployed the APIs, we'll access the API Manager you used in exercise 2.

Navigate to Bluemix: https://new-console.ng.bluemix.net and ensure you are logged in. Choose APIs using the drop-down at the top, and select your API Connect service. This launches the API Manager.

Double check that you're in the `Dashboard` view by selecting the sandwich button on the top left and clicking Dashboard.

Click the `Sandbox` Catalog, where you should see the Employee API you deployed earlier.

In this view, you can edit the lifecycle of the API, control its visibility and see analytics. For now, we'll simply Explore the APIs.  Hit the `Explore` button on the top right, and choose your `Sandbox` catalog.

In this view, we can explore all the APIs in the chosen catalog.

#### GET /Employees

Navigate to the operation `GET /Employees`. Along the right side, there is a black section which shows you how to call that operation, shows a sample response, and has a button "Call Operation". Hit the button to call your GET operation.

You should see a `200 OK` response, along with an empty array in the response body: `[]`.  This is because you haven't stored anything in the database yet!

#### POST /Employees

Navigate to the operation `POST /Employees` to create a database entry. Scroll down to the "Call Operation" button, enter some data into the Paramters section (or use the `Generate` button), and hit call Operation.

You should see a `200 OK` response, as well as a response body indicating that the database update has succeeded. You can now call the `GET /Employees` operation again to see the employee entry you just created.

### Next steps

In the next exercises, we'll create a developer portal so others can consume your APIs.

Next up, Exercise 9: [Generate a Developer Portal for your APIs](../exercises/ex9)
