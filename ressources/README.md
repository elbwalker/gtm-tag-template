# Using The Example walker.js Configuration in GTM
The code contained in `example-init-tag.html` can be used as a starting point for loading and implementing the walker.js library using a Custom HTML tag inside Google Tag Manager. 

Copy the code and add it to a new tag that can either be fired on every page whenever there is consent. Do not forget to change the endpoint URL and path to walker.js. The setup is based on the sample implementation / configuration in `walker-init.js` from the ssGTM client template repository [here](https://github.com/elbwalker/sgtm-client-template/tree/main/example#readme).

## Handling Consent
This example code replicates the usage of *localStorage* and *sessionStorage* for keeping track of a client id, a session id and session numbers (neccessary for GA4) like demonstrated in `walker-init.js` in the ssGTM example. You will have to adopt this part of the code to use your own implementation for persistent values like cookies or at least add the keys used in this example to your privacy information, consent dialog or similar. 

### Use Destination
A different approach would be to add consent-sensitivity to the walker.js destination and let walker.js know when there is consent. More info about consent handling can be found in the [elbwalker docs](https://docs.elbwalker.com/privacy/consent). 

Adding events to the `elbLayer` (using code or the client template from this repository) then can be done without fear of sending events to your endpoint when the user opts out (or has not yet made a choice).

### Use Triggers
If you already have an existing implementation, all triggers needed for respecting consent are most likely already available. You can add walker.js tags as an addition to or replacement for your existing tag (like Universal Analytics or GA4). 

### Let The Server Decide
The simple example for the [server-side GTM client template](https://github.com/elbwalker/sgtm-client-template/tree/main/example#readme) sends every event to ssGTM and just adds persistent user information and parameters about the session if consent is granted. Otherwise, events with a reduced amount of information still get sent to the server. Every event contains information about the consent state. You can replicate this concept and add triggers to your ssGTM tags that only fire if there is consent (and all information needed for the service is available in the events).     
