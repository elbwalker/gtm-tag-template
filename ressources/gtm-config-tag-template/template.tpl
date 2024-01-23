___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "walker.js Configuration",
  "brand": {
    "id": "mbaersch",
    "displayName": "mbaersch",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAYCAYAAACbU/80AAAABmJLR0QAvgD/ALe9KR/IAAAACXBIWXMAAC4jAAAuIwF4pT92AAAAB3RJTUUH5gseEAEKLjc4rQAAABl0RVh0Q29tbWVudABDcmVhdGVkIHdpdGggR0lNUFeBDhcAAAMSSURBVEjH1VZLSJRRFP7O/f9hMoqMYoasGBOpaFNhSIvohSA12juSorIHahKJLaRVm6BAKiQj8gGJEC6KQJ0BLUjalIsgadVLZ4wk/ikpSR0dnXtaKGYzZ/75d9Fdnu+e8333nHPPvcA/XuR0o6cztJiUug6iEgDL5wDm3Zbf12Pn6w2GNwFUB6KtANyzfl8sv2+16ZA8gwyjB0DeXwBzH0fHXtiSB0K7QKobgCsBqgUA5ShNhnEliXxm1UeObNApyTsHCKSaBfIx1vFWRwI87Z8WADgnQF/1RLTNXjkdAFFOkp25IVKcM+JIAJmukwBWCkFavh1eH7V1VkaVYNUA189tcVCBMsE2zvH4bdvadwxsBrBDEN5u+bPDjgR4g4MFINoiBHkU2Zfz3Va2YVSnQG7+laQ0p5dTyFyX5totBdFRQfhby+976UiANziYC6K9AvTcKsruSyO8BsACwX4jqU1sglSKuNZ37O992AVSZ5IRHgbwxJEAbyCcCaJyAfrAU7FAmtOfBeAV0l9n+X2xRLOZ4v6eBrBQCHI/cnAte4Ph7QBVAygEeDYz3GUVrzkEpS4IESdBqsHRW+Bp7zfJND+DaEUC+y+enMwil+swlNEiiPOD9RSU8VTAmiy/r0wcFcmDx9yTTA6A0QTTZUIZ9QJBSP8Y7oJSVWJGmRtTzirBdlUKAa1vk1IXASwW8FtqydJcgAoF12dWUfZrRwK8gXBeisHTbhWvGQLhvEAwDq0fQqlLYk9pvms7rROa73KKFNZ6AqHjAPmE3NxjsALRCcHvnR4dCTgS4OnozwLRMSHIG6so+xUp44xYGuYHZJinAGQK+L1vJRu1nQDzz5tvVgIwhD213s7QZgAFgrguAJ/A3A1KulDfOTbxIN1LZwKA58n7DBBVCARDHI8/JtNoTFGaOyAqBtEqAWuNHFw36kgAud2lAJYJeDmIMgHxYWnjWKyb3O5ewe8jT09dc/LbmukBUhUJwXvBeqfl9wVJqUoAi+ahEbCu4eh4Kbnd+SDKn/9PAHMzpqe3Rfbn/sT/sH4DfEUaJgR8khoAAAAASUVORK5CYII\u003d"
  },
  "description": "Load and configure walker.js",
  "categories": [
    "ANALYTICS"
  ],
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "GROUP",
    "name": "groupGeneral",
    "displayName": "General Settings",
    "groupStyle": "NO_ZIPPY",
    "subParams": [
      {
        "type": "TEXT",
        "name": "configVersion",
        "displayName": "Configuration Version",
        "simpleValueType": true,
        "help": "Enter a version number (integer) for the current configuration. Will be sent as version.config in events when using walker.js v1.6+.",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          },
          {
            "type": "NON_NEGATIVE_NUMBER"
          }
        ],
        "defaultValue": 1
      },
      {
        "type": "CHECKBOX",
        "name": "loadWalker",
        "checkboxText": "Load walker.js Script",
        "simpleValueType": true,
        "help": "Check option to inject walker.js from the defined source.",
        "defaultValue": true
      },
      {
        "type": "LABEL",
        "name": "labelPath",
        "displayName": "NOTE: you have adjust the template permissions using the template editor to allow access for the script, if you want to load walker.js from a different domain.",
        "enablingConditions": [
          {
            "paramName": "loadWalker",
            "paramValue": true,
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "walkerPath",
        "displayName": "Path To walker.js",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "loadWalker",
            "paramValue": true,
            "type": "EQUALS"
          }
        ],
        "defaultValue": "https://cdn.jsdelivr.net/npm/@elbwalker/walker.js@2.0.0/dist/walker.js"
      },
      {
        "type": "TEXT",
        "name": "destination",
        "displayName": "Destination Callback (optional)",
        "simpleValueType": true,
        "help": "Set to a Custom JavaScript variable that returns a destination object. See https://github.com/elbwalker/gtm-tag-template/tree/main/ressources/gtm-config-tag-template#destination-callback for more details."
      },
      {
        "type": "SIMPLE_TABLE",
        "name": "additionalDestinations",
        "displayName": "Additional Destinations",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Destination",
            "name": "destination",
            "type": "TEXT"
          }
        ],
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "help": "Add additional destinations if you want to run several tags with individual consent settings."
      },
      {
        "type": "CHECKBOX",
        "name": "runWalker",
        "checkboxText": "Call \"walker run\"",
        "simpleValueType": true,
        "defaultValue": true
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "groupGlobals",
    "displayName": "Configure \"globals\"",
    "groupStyle": "NO_ZIPPY",
    "subParams": [
      {
        "type": "LABEL",
        "name": "labelGlobals",
        "displayName": "Optionally add keys and values to be added to walker.js global object."
      },
      {
        "type": "PARAM_TABLE",
        "name": "globalsData",
        "displayName": "",
        "paramTableColumns": [
          {
            "param": {
              "type": "TEXT",
              "name": "key",
              "displayName": "Global Key",
              "simpleValueType": true
            },
            "isUnique": true
          },
          {
            "param": {
              "type": "TEXT",
              "name": "value",
              "displayName": "Value",
              "simpleValueType": true
            },
            "isUnique": false
          }
        ]
      }
    ],
    "help": "Works only when using walker.js v1.6+. Set globals as DOM elements for older versions."
  },
  {
    "type": "GROUP",
    "name": "groupUser",
    "displayName": "Configure \"user\"",
    "groupStyle": "NO_ZIPPY",
    "subParams": [
      {
        "type": "TEXT",
        "name": "sessionId",
        "displayName": "Session ID (optional)",
        "simpleValueType": true
      },
      {
        "type": "TEXT",
        "name": "deviceId",
        "displayName": "Device ID (optional)",
        "simpleValueType": true
      },
      {
        "type": "TEXT",
        "name": "userId",
        "displayName": "User ID (optional)",
        "simpleValueType": true
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "groupConsent",
    "displayName": "Configure \"consent\"",
    "groupStyle": "NO_ZIPPY",
    "subParams": [
      {
        "type": "LABEL",
        "name": "labelConsent",
        "displayName": "Consent keys and values to be added to walker.js consent state."
      },
      {
        "type": "PARAM_TABLE",
        "name": "consentData",
        "displayName": "",
        "paramTableColumns": [
          {
            "param": {
              "type": "TEXT",
              "name": "key",
              "displayName": "Consent Key",
              "simpleValueType": true
            },
            "isUnique": true
          },
          {
            "param": {
              "type": "SELECT",
              "name": "value",
              "displayName": "Consent Value",
              "macrosInSelect": true,
              "selectItems": [
                {
                  "value": true,
                  "displayValue": "true"
                },
                {
                  "value": false,
                  "displayValue": "false"
                }
              ],
              "simpleValueType": true
            },
            "isUnique": false
          }
        ]
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

/**
 * @description Custom Google Tag Manager Tag Template for walker.js - Configuration
 * @version 0.1.1
 * @see {@link https://github.com/elbwalker on GitHub} for more about walker.js
 */

let elb = require("createArgumentsQueue")("elb", "elbLayer");

// load script
if (data.loadWalker === true && data.walkerPath)
  require("injectScript")(data.walkerPath, undefined, data.gtmOnFailure, "elbwalker");


// populate globals object 
let globalsInfo = {};
if (data.globalsData && data.globalsData.length > 0) {
  data.globalsData.forEach(x=>{
    let v = x.value;
    if (v) globalsInfo[x.key] = v;
  });
}  

elb("walker config", { 
  version: data.configVersion, 
  //walker.js >= 2.x
  tagging: data.configVersion, 
  globals: globalsInfo 
}); 

// set user properties  
if (data.sessionId || data.deviceId || data.userId) {
  elb("walker user", {
    hash: data.sessionId, //adding hash for walker.js < v1.6
    session: data.sessionId, 
    device: data.deviceId, 
    id: data.userId});
}

// define consent 
if (data.consentData && data.consentData.length > 0) {
  let consentInfo = {};
  data.consentData.forEach(x=>{
    consentInfo[x.key] = !!x.value;
  });
  elb("walker consent", consentInfo);
}  

// set destination from callback variable 
if (data.destination) elb("walker destination", data.destination); 
if (data.additionalDestinations)
  data.additionalDestinations.forEach(d=>{
    if (d.destination) 
      elb("walker destination", d.destination); 
  });

// configuration done - run if defined
if (data.runWalker === true) elb("walker run");

data.gtmOnSuccess();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "elb"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "elbLayer"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://cdn.jsdelivr.net/"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 10.12.2022, 01:34:32
