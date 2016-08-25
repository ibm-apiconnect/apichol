# API Connect Hands-On Labs

## Exercise 6: Create database CRUD APIs with LoopBack models

### Prerequisites

To run through this exercise, you will need to have done the following steps:

**Prerequisite 1** Installed the API Connect toolkit ([Exercise 2](exercises/ex2))

**Prerequisite 2** Generated a LoopBack app ([Exercise 4](exercises/ex4))

**Prerequisite 3** Created a database service on Bluemix and connected it to your LoopBack app ([Exercise 5](exercises/ex5))

### Ensure that you are in the LoopBack application directory

Ensure that you are in the LoopBack directory you created in [Exercise 2](exercises/ex2)

```
cd <path-to-loopback-folder>
```

### Launch the API Connect Designer (Developer toolkit)

The API Connect Designer is a GUI that allows developers to graphically create and manage their APIs. 

```
apic edit
```

After a brief pause, the following message is displayed.

`Express server listening on http://127.0.0.1:9000`

The API Designer opens in your default web browser. If it prompts you to login, use your IBM Bluemix credentials.

### Create a database connection

Click on the Data Sources tab. Hit the "Add" button, and choose name for your database - "mysql-db".

![Creating a database connection](SS1.png)

In the connector tab, choose "MySQL". It'll prompt you to install the connector; simply follow the prompts.

TODO: Clarify how to find credentials for service on Bluemix.

Enter the database credentials you noted in [Exercise 5](exercises/ex5). If you need to find them again, simply navigate to your service on Bluemix and find the credentials.

TODO: Add screenshot. <SS2>

Hit the Save button on the top-right. This should test your database connection and alert you if your credentials are incorrect or if the connection was unable to be made.

### Create Models to work with your database

Create an "Employee" model so that you're able to perform CRUD (Create/Read/Update/Delete) operations against your MySQL database.

TODO: Add screenshot. <SS3>

That's it! Once a model is created, the APIs to represent that model are automatically generated for you.

### Next steps

In the next exercise, we will test your new APIs by starting the LoopBack application locally and using an interactive OpenAPI explorer to call your APIs!