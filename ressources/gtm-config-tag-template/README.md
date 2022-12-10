# walker.js Configuration - Custom Tag Template for Google Tag Manager
The code from `template.tpl` in this folder can be imported as a new tag template in GTM in order to (optionally) load and configure walker.js. It can be used as an alternative for manual configuration shown in the example Custom HTML init tag `example-init-tag.html` from the parent folder. 

## Usage
Import the template in GTM´s template editor and add a new tag using this template. When and how to trigger the tag depends on your implementation and configuration.  

## General Settings

### Load Script
If you do not load walker.js directly from your website or using a separate (HTML) tag in GTM, you can check the option and define a path to the desired version of walker.js. The default path loads walker.js in version 1.6 from a CDN. 

This is not the best solution for a robust first party setup. If you want to use GTM to load walker.js from a first party path on your own server, you have two options: 

#### Option 1: Adjust Template for First Party Script Loading 
If you want to use the tag for loading walker.js from your own domain, go to the *Permissions* tab and add your path to the list of allowed URL match patterns in the *Inject Scripts* section. 

#### Option 2: Use a Custom HTML Tag
walker.js can be loaded in a separate tag without having to bother with race conditions. Instead of using the option to use the tag for loading, you can create a Custom HTML tag with the following code and trigger it ehenever appropriate:

```
<script>
  var wsc = document.createElement("script");
  wsc.type = "text/javascript"; 
  wsc.className = "elbwalker";
  wsc.dataset.version = "1"; //your version here
  wsc.async = true; 
  wsc.defer = true; 
  wsc.src = "/my/path/to/walker.js"; //add your path (relative or complete) to walker.js 
  document.head.appendChild(wsc);
</script>

```
### Destination Callback
Adding one or more destinations for walker.js to feed with events can be achieved by using separate code in HTML tags as well. As an option, you can add a destination as a Custom JavaScript variable in the tag configuration. 

Here is an example code that you can add to a new *Custom JavaScript* variable in GTM to be used as destination. The code sends all events to a custom endpoint, where a server-side Google Tag Manager (using the [SGTM client template](https://github.com/elbwalker/sgtm-client-template)) can process them. 

```
/**
 * example walker.js destination for custom endpoint as GTM Custom JS Variable 
 * @description sends event as base64 coded JSON to defined URL as parameter "o"
 * @returns {obect} with defined keys for "config" object and "push" method
 * @see {@link https://docs.elbwalker.com/destinations/basics|elwalker docs} for more details
 */
function(){
  
  return {
    
    config: {
      //TODO: add a consent condition if destination should only fire when specific consent is granted
      //example:
      //consent: {someConsent: true}
    },
    
    push: function (event) {
      //TODO: add your ssGTM endpoint URL here:
      var url = "https://sgtm.example.com/elbwalker";
      
      //sends simple GET request with base64 coded payload as parameter
      //TODO: adjust to use fetch() or sendBeacon for a POST request
      //see https://github.com/elbwalker/sgtm-client-template/blob/main/example/walker-init.js
      //for an example
      var obs = JSON.stringify(event);
      if (obs === "{}") 
        obs = ""; 
      else  
        obs = btoa(unescape(encodeURIComponent(obs)));
      var params = (obs !== "") ? "?o=" + encodeURI(obs) : "";
      (new Image()).src = url + params;
      //log event to console for debugging purposes 
      //TODO: comment out for live operation
      console.log(event);
    }
  }
  
}

```
### Call "walker run"
For a complete configuration that "starts" the walker, check this option. In other use cases you might want to fire a tag that calls `elb("walker run")` at a later stage. 

## Globals
Adding keys and values to the `global` object for all walker.js events dispatched with this configuration can be done by adding them to a table. Unset values will be skipped. 

## User Configuration
In order to add a user object to events, set the values for a session (minimal for most use cases), a device id or a user id. 

## Consent Settings
All keys defined in this section serve for populating the `consent` object (when using walker.js v1.6+) as well as controlling which destinations to activate, ehen events occur. This setting initializes the consent object. Consent state can be changed afterwards by using `elb("walker consent, {...}")`. States can be set to an initial *true*, *false* or by using a variable. All values set by variables will be converted to boolean.   

---

## Example Configuration for GA4 + SGTM Client
In case you send events to a SGTM and want the client to generate all data in the SGTM event model neccessary for sending events zu GA4, you will have to add session information in pre-defined event parameters in the `globals` object. 

This section demonstrates how to use this configuration tag template to generate pageviews and enable the usage of the event tag template from this repository´s main folder to build a complete GA4 tagging with walker.js.

### Step 1: Add a Session Helper HTML Tag
GA4 needs several session data in order to properly process events. This example code replicates the usage of *localStorage* and *sessionStorage* for keeping track of a client id, a session id and session numbers neccessary for GA4. This method matches `example-init-tag.html` from the parent folder of this template. You will have to adopt this part of the code to use your own implementation for persistent values like cookies or at least add the keys used in this example to your privacy information, consent dialog or similar. 

Add a new Custom HTML tag in GTM and paste the following code: 

```
<script>
  
  //NOTE: you should use cookies in case of multiple hosts
  var sts = window.sessionStorage.getItem("lg_sts");
  var sid = window.sessionStorage.getItem("lg_sid");
  var sct = window.localStorage.getItem("lg_sct") || 0;
  var cid = window.localStorage.getItem("lg_cid");

  var sStart = false;

  if (!sts) {
    //new session
    sStart = true;
    sts = Math.round(Date.now() / 1000);
    sid = Math.round(Math.random() * 10000000000);
    window.sessionStorage.setItem("lg_sts", sts);
    window.sessionStorage.setItem("lg_sid", sid);
    sct++;
    window.localStorage.setItem("lg_sct", sct);
  }

  //simple user management via localStorage as well - switch to cookies or set
  //server-side id cookie for a more robust identification of returning visitors 
  if (!cid) {
    //just paste random session id and timestamp for a new persistent client id
    cid = sts+"."+sid;
    window.localStorage.setItem("lg_cid", cid);
  }
  
  window.dataLayer.push({
    event: "sessionDataReady",
    sessionId: sid, 
    sessionNumber: sct, 
    sessionStartTimestamp: sts, 
    clientId: cid, 
    sessionStart: sStart
  });

</script>

```

This tag reads session information from the browser´s storage and sets new values in case of a new user and / or session. The values then get pushed to the dataLayer, where GTM variables can pick them up to be used in the walker.js configuration tag.

### Step 2: Create Variables
Create multiple *Data Layer* variables in GTM to read the following keys from the dataLayer:

- sessionId 
- sessionNumber
- sessionStartTimestamp 
- clientId 
- sessionStart

Note: this example uses the dataLayer key as variable name (`{{sessionId}}`, `{{sessionNumber}}`, ...) - you can adjust them to match your maning conventions. 

If you want to make sure every event has a page title in GA4, add a *JavaScript Variable* and define `document.title` as *Global Variable Name*. Call this variable `{{document.title}}` 

### Step 3: Configuration Tag
Add the following keys and values in your walker.js configuration tag in the *Configure "globals"* section: 

| Key             | Value                     |
|-----------------|---------------------------|
| page_title      | {{document.title}}        |
| session_started | {{sessionStartTimestamp}} |
| session_number  | {{sessionNumber}}         |
| session_start   | {{sessionStart}}          |

*Note*: make sure to include *"globals"* as event parameters in your SGTM client configuration in order to make the values accessible to GA4. 

Then configure *User* to include the `{{sessionId}}` as Session ID and `{{clientId}}` as Device ID and add a *Destination Callback* for sending all events to your SGTM like shown in the exampke callback JS variable code above. 

All other fields like consent or loading of walker.js can be configured to match your reuirements.   

### Use Triggers
The session helper tag pushes all client- and session data to the dataLayer along with an event key called `sessionDataReady`. Create a *Custom Event* trigger in GTM to fire the configuration tag. Depending on how you handle consent in the destination, events will then be sent to SGTM where you can process them and hand data over to different vendors respecting consent (sent with every event).   
