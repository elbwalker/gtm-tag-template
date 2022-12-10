<p align="left">
  <a href="https://elbwalker.com">
    <img title="elbwalker" src='https://www.elbwalker.com/elbwalker.png' width="300px"/>
  </a>
</p>

# elbwalker Google Tag Manager Custom Tag Template
Google Tag Manager Custom Tag Template. Creates events for walker.js. This is a beta template release. 

[![Beta Status](https://img.shields.io/badge/Status-Beta-yellow.svg)](https://shields.io/)

## Usage
Install this template and add one or more tags to define walker.js events that get pushed to the elbLayer for processing. 

**Important Note**: a Custom HTML tag for loading and configuring walker.js is required in order to send the events created with this template to the desired destinations. An example configuration is included in the `ressources` folder. The example sends events to a debugging endpoint but can be configured to use a ssGTM as endpoint where a [walker.js ssGTM client](https://github.com/elbwalker/sgtm-client-template) can receive and process them. 

### Defining Events
The template (re) defines an `elb()` function and initializes the `elbLayer` if if does not exist and then adds the event configured in the template fields. 

Add at least *Entity* and *Action* in order to define a proper event. The *Trigger* can be picked from a list (including standard trigger events from the [documentation](https://docs.elbwalker.com/tagging/available-triggers)) or defined as a variable. If the variable value is empty, the trigger will use `unknown` as fallback. 

#### "data" and "context"
Both `data` and `context` objects included in a walker.js event can be populated or left empty. Values can be defined as a variable containing an object (generated with a Custom JS Variable or read from the dataLayer) or using a table, where key / value pairs can be defined individually. 

*Note*: If you provide an object, make sure that it has a flat structure in order to define a proper walker.js event. if validation is part of event processing at some point - even if walker.js will work with `context` objects containing arrays or nested objects. 

**Example Custom JavaScript GTM variable**: this code demonstrates how to build a variable returning a possible `data` or `context` object with (stupid) event parameters: 

```
function(){
  return {
    "element_id": "element37",
    "element_name": "Some random DOM element",
    "IdTag": 22050000,
    "something_dynamic": {{your variable name here}},
    "element_category": "Promo"
  };
}
```

**Using Events For GA4**
In case the destination is a server-side GTM (llie mentioned above), the `event` key of the walker.js events will not fit the event name in the GA4 scheme. To send events with the desired name, you can either use the translate table in the ssGTM client or send a `data` or `context` key named `event_name` with a GA4 event name like *add_to_cart*, *purchase*, *view_item*...   

#### Using The "nested" Object
walker.js uses a `nested` array that can hold multiple (and as well nested) entities. The [documentation](https://docs.elbwalker.com/tagging/nested-entities) describes the format that includes a `type` and a `data` object, containing the key/value pairs that describe the object. 

The source can be any object (that is either a "walker.js-ready" nested array) defined as variable or a standard e-commerce dataLayer (ecommerce.items). An option allows to convert `items` from an e-commerce dataLayer to walker.js format, using *product* as `type` and adding every object in the input array to the `data` key. 

## Examples
Some example configurations: 

### Add To Cart
Use the collowing setup to send an `add_to_cart` event that can be forwarded to GA4 by the walker.js client on a ssGTM: 

![image](https://user-images.githubusercontent.com/15323700/205529071-b26f81f1-8efd-4fab-a15f-2bc85cd65703.png)

Similar configurations can be used to send other e-commerce events. Add more parameters to `data` or `context` in order to define all properties and parameters for GA4 and let the client on ssGTM include both objects as event parameters in the ssGTM event model. 

### Purchase
When a purchase is sent, a walker.js event usually includes details for the transaction in the `data` object. This can be done by using dataLayer variables and populate GA4 e-commerce parameters with values. 

![image](https://user-images.githubusercontent.com/15323700/205529691-a31f4a32-ef37-4e57-9eaa-9a5b48a85b30.png)

If the implemented dataLayer does not use the GA4 format or does not get cleared and contains wrong items, pick "Object" as a source for the `nested` array and pick a variable that accesses / contains the desired item data. Either an array with all attributes for GA4 *items* or any other object containing an `ecommerce.items` or `items` key with those attributes, so that any structure that is / was used to feed GA4 tags should be sufficient. 