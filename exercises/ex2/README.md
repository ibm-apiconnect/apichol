#API Connect Hands-On Labs

##Exercise 2: Design your OpenAPI Swagger specification

### Prerequisites

Make sure you've met the following prerequisites.

**Prerequisite 1**: Installed the API Connect toolkit ([Exercise 1](../ex1)).

### Ensure that you are in the right sub-directory

Ensure that you are in sub-directory ex2.

```
cd <path-to-hol-folder>/exercises/ex2
```

### Overview of exercise

For this exercise, we'll:

1. Learn about the OpenAPI Specification (Swagger Specification) 2.0 and its components
2. Learn how to use Swagger Editor to design and modify an existing Swagger JSON specification of an API
3. Learn how to import an OpenAPI Specification into API Designer for further editing

### [OpenAPI](https://github.com/OAI/OpenAPI-Specification) (Current Version: 2.0)
The Open API Specification (formerly known as the Swagger specification) is the industry standard for defining REST APIs.  The goal of the OpenAPI Specification is to define a standard, language-agnostic interface to REST APIs which allows both humans and computers to discover and understand the capabilities of the service without access to source code, documentation, or through network traffic inspection. When properly defined via OpenAPI, a consumer can understand and interact with the remote service with a minimal amount of implementation logic.

<blockquote>OpenAPI specs remove the guesswork in calling a given service</blockquote>

#### [OpenAPI Components](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md)

- FORMAT:  The files describing the RESTful API in accordance with the Swagger specification are represented as **JSON objects** and conform to the JSON standards. YAML, being a superset of JSON, can be used as well to represent a Swagger specification file.
- BENEFITS:  With a OpenAPI specifcation, you'll be able to generate client libraries in lots of runtime languages, generate server stubs, import these definitions into API management tools such as Bluemix APIConnect and use tools to verify conformance. 

### [Swagger Editor](http://editor.swagger.io/#/)
Swagger Editor at [http://editor.swagger.io/#/](http://editor.swagger.io/#/) is a handy open source web application that lets you quickly edit OpenAPI Swagger specifications in YAML or JSON.  You can import or create custom specifications within a browser.  We'll use this hosted editor and a Swagger JSON specification **macreduce.mybluemix.net.json** located within the ex2 sub-directory to illustrate the use of the editor and how it can be used to design/modify a Swagger specification.

#### Exploring an OpenAPI (Swagger) 2.0 Specification

1.  Browse to [Swagger Editor](http://editor.swagger.io/#/) and click on the File menu choice **Import File...** .  You will select the macreduce.mybluemix.net.yaml file found within your ex2 sub-directory.     <br/><br/>     ![swagger](https://raw.githubusercontent.com/ragsns/apichol/master/images/ex2/swaggerspec_import.png)

    ![swagger](https://raw.githubusercontent.com/ragsns/apichol/master/images/ex2/importfile.png) 
2.  After import, you should see a split pane view with the raw text Swagger spec on the left and a rendered view on the right. <br/>
    
    ![swagger](https://raw.githubusercontent.com/ragsns/apichol/master/images/ex2/macreduce.png) 
3.  We will now make a modification to the existing swagger specification.  Browse to the section of the spec that looks similiar to: 
```
  '/mac/{macId}':
      get:
        summary: Retrieves a Mac document
        responses:
          '200':
            description: Mac document fetched successfully
        parameters:
          - in: path
            name: macId
  [...]
```

We will add an expected response to document the API's behavior when attempting to fetch a non-existent macId resource.  Add two lines just above the parameters section so that it now looks like this:

```
  '/mac/{macId}':
      get:
        summary: Retrieves a Mac document
        responses:
          '200':
            description: Mac document fetched successfully
          '404':
            description: Mac document not found
        parameters:
          - in: path
            name: macId
 [...]
```
  The specification provides a wide variety of data elements to facilitate describing your API set.  As you inspect your OpenAPI specification file, some important elements to consider include: 

  -  method types (get, post, delete, ...)
  -  responses (200, 400, 404, ...)
  -  parameters
  -  paths
  -  content-types (application/json, application/xml, ...)

4.  Click on the File menu choice **Download JSON** to obtain a local copy of your newly modified OpenAPI Swagger 2.0 specification.     <br/><br/>     ![swagger](https://raw.githubusercontent.com/ragsns/apichol/master/images/ex2/downloadjson.png) 
5.  As you can see, Swagger Editor is a great tool for modifying existing OpenAPI specifications and/or creating brand new specifications.  

### [Open API Spec Explorer and Designer](https://console.ng.bluemix.net/docs/services/apiconnect/apic_003.html#apic_009)

To open the API Designer, on the command line enter:

```
SKIP_LOGIN=true apic edit
```

This should result in the API Designer opening within your default web browser.

Our next step is to import the OpenAPI specification into API Designer.  To accomplish this, click on the **+ Add** link and select the Import OpenAPI choice
<br/><br/>
![importopenapi](https://raw.githubusercontent.com/ragsns/apichol/master/images/ex2/importopenapi.png)

You will want to browse to the location where you downloaded the swagger.json file created from Swagger editor and click on the **Import** button.

This should cause focus on the API Design tab with various fields populated via data found within the OpenAPI specification file.  Feel free to explore the various section links on the left to get a feel for design options available to you.
<br/><br/>
![apidesignview](https://raw.githubusercontent.com/ragsns/apichol/master/images/ex2/apidesignview.png)

It is also worth noting that if you already possess an existing backend API application, you can publish this Open API (Swagger) specification to Bluemix whereby the platform would then manage your existing APIs for you.  Platforms such as Bluemix are great at providing analytics, gateway, security, authentication and user management facilities for your API needs.

### Summary of exercise and next steps
We've now learned quite a bit.  We know what an Open API (Swagger) specification is, how its used and what is its composition.  We've explored a couple of tools that assist us with Open API design, composition and management.

In [Exercise 3](../ex3), we'll create a Loopback Application against these defined APIs.  Having a backend application takes the conceptual descriptions within the spec and makes them concrete (e.g. Functional Create, Read, Update and Delete API endpoints).