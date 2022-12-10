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
  "displayName": "walker.js Event",
  "brand": {
    "id": "mbaersch",
    "displayName": "mbaersch",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAYCAYAAACbU/80AAAABmJLR0QAvgD/ALe9KR/IAAAACXBIWXMAAC4jAAAuIwF4pT92AAAAB3RJTUUH5gseEAEKLjc4rQAAABl0RVh0Q29tbWVudABDcmVhdGVkIHdpdGggR0lNUFeBDhcAAAMSSURBVEjH1VZLSJRRFP7O/f9hMoqMYoasGBOpaFNhSIvohSA12juSorIHahKJLaRVm6BAKiQj8gGJEC6KQJ0BLUjalIsgadVLZ4wk/ikpSR0dnXtaKGYzZ/75d9Fdnu+e8333nHPPvcA/XuR0o6cztJiUug6iEgDL5wDm3Zbf12Pn6w2GNwFUB6KtANyzfl8sv2+16ZA8gwyjB0DeXwBzH0fHXtiSB0K7QKobgCsBqgUA5ShNhnEliXxm1UeObNApyTsHCKSaBfIx1vFWRwI87Z8WADgnQF/1RLTNXjkdAFFOkp25IVKcM+JIAJmukwBWCkFavh1eH7V1VkaVYNUA189tcVCBMsE2zvH4bdvadwxsBrBDEN5u+bPDjgR4g4MFINoiBHkU2Zfz3Va2YVSnQG7+laQ0p5dTyFyX5totBdFRQfhby+976UiANziYC6K9AvTcKsruSyO8BsACwX4jqU1sglSKuNZ37O992AVSZ5IRHgbwxJEAbyCcCaJyAfrAU7FAmtOfBeAV0l9n+X2xRLOZ4v6eBrBQCHI/cnAte4Ph7QBVAygEeDYz3GUVrzkEpS4IESdBqsHRW+Bp7zfJND+DaEUC+y+enMwil+swlNEiiPOD9RSU8VTAmiy/r0wcFcmDx9yTTA6A0QTTZUIZ9QJBSP8Y7oJSVWJGmRtTzirBdlUKAa1vk1IXASwW8FtqydJcgAoF12dWUfZrRwK8gXBeisHTbhWvGQLhvEAwDq0fQqlLYk9pvms7rROa73KKFNZ6AqHjAPmE3NxjsALRCcHvnR4dCTgS4OnozwLRMSHIG6so+xUp44xYGuYHZJinAGQK+L1vJRu1nQDzz5tvVgIwhD213s7QZgAFgrguAJ/A3A1KulDfOTbxIN1LZwKA58n7DBBVCARDHI8/JtNoTFGaOyAqBtEqAWuNHFw36kgAud2lAJYJeDmIMgHxYWnjWKyb3O5ewe8jT09dc/LbmukBUhUJwXvBeqfl9wVJqUoAi+ahEbCu4eh4Kbnd+SDKn/9PAHMzpqe3Rfbn/sT/sH4DfEUaJgR8khoAAAAASUVORK5CYII\u003d"
  },
  "description": "Create events for walker.js. Needs a seperately loaded and configured walker.js  script - Go to elbwalker.com for more information.",
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
    "type": "LABEL",
    "name": "actionInfo",
    "displayName": "Every walker.event consists of mandatory entity and action values that build the \"event name\". Tip: you can define a different event name in \"context\" or \"data\" using the key \"event_name\" and other event parameters if you use a server-side GTM to send events to GA4."
  },
  {
    "type": "TEXT",
    "name": "entity",
    "displayName": "Entity",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "action",
    "displayName": "Action",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "SELECT",
    "name": "trigger",
    "displayName": "Trigger",
    "macrosInSelect": true,
    "selectItems": [
      {
        "value": "load",
        "displayValue": "load"
      },
      {
        "value": "click",
        "displayValue": "click"
      },
      {
        "value": "visible",
        "displayValue": "visible"
      },
      {
        "value": "hover",
        "displayValue": "hover"
      },
      {
        "value": "submit",
        "displayValue": "submit"
      },
      {
        "value": "wait",
        "displayValue": "wait"
      },
      {
        "value": "pulse",
        "displayValue": "pulse"
      },
      {
        "value": "custom",
        "displayValue": "custom"
      },
      {
        "value": "scroll",
        "displayValue": "scroll"
      },
      {
        "value": "unload",
        "displayValue": "unload"
      }
    ],
    "simpleValueType": true
  },
  {
    "type": "GROUP",
    "name": "dataSection",
    "displayName": "Add \"data\"",
    "groupStyle": "NO_ZIPPY",
    "subParams": [
      {
        "type": "SELECT",
        "name": "dataType",
        "displayName": "Source",
        "macrosInSelect": false,
        "selectItems": [
          {
            "value": "none",
            "displayValue": "No data information"
          },
          {
            "value": "object",
            "displayValue": "Define Object"
          },
          {
            "value": "table",
            "displayValue": "Define Table"
          }
        ],
        "simpleValueType": true,
        "defaultValue": "none"
      },
      {
        "type": "TEXT",
        "name": "dataObject",
        "displayName": "Object Variable",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "dataType",
            "paramValue": "object",
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "PARAM_TABLE",
        "name": "dataTable",
        "displayName": "Define \"data\" Content",
        "paramTableColumns": [
          {
            "param": {
              "type": "TEXT",
              "name": "fieldName",
              "displayName": "Key",
              "simpleValueType": true
            },
            "isUnique": true
          },
          {
            "param": {
              "type": "TEXT",
              "name": "fieldValue",
              "displayName": "Value",
              "simpleValueType": true
            },
            "isUnique": false
          }
        ],
        "enablingConditions": [
          {
            "paramName": "dataType",
            "paramValue": "table",
            "type": "EQUALS"
          }
        ]
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "contextSection",
    "displayName": "Add \"context\"",
    "groupStyle": "NO_ZIPPY",
    "subParams": [
      {
        "type": "SELECT",
        "name": "contextType",
        "displayName": "Source",
        "macrosInSelect": false,
        "selectItems": [
          {
            "value": "none",
            "displayValue": "No context information"
          },
          {
            "value": "object",
            "displayValue": "Define Object"
          },
          {
            "value": "table",
            "displayValue": "Define Table"
          }
        ],
        "simpleValueType": true,
        "defaultValue": "none"
      },
      {
        "type": "TEXT",
        "name": "contextObject",
        "displayName": "Context Variable",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "contextType",
            "paramValue": "object",
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "PARAM_TABLE",
        "name": "contextTable",
        "displayName": "Define \"context\" Content",
        "paramTableColumns": [
          {
            "param": {
              "type": "TEXT",
              "name": "fieldName",
              "displayName": "Key",
              "simpleValueType": true
            },
            "isUnique": true
          },
          {
            "param": {
              "type": "TEXT",
              "name": "fieldValue",
              "displayName": "Value",
              "simpleValueType": true
            },
            "isUnique": false
          }
        ],
        "enablingConditions": [
          {
            "paramName": "contextType",
            "paramValue": "table",
            "type": "EQUALS"
          }
        ]
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "nestedSection",
    "displayName": "Add \"nested\"",
    "groupStyle": "NO_ZIPPY",
    "subParams": [
      {
        "type": "SELECT",
        "name": "nestedType",
        "displayName": "Source",
        "macrosInSelect": false,
        "selectItems": [
          {
            "value": "none",
            "displayValue": "No nested information"
          },
          {
            "value": "object",
            "displayValue": "Define Object"
          },
          {
            "value": "dataLayer",
            "displayValue": "Use dataLayer (ecommerce.items)"
          }
        ],
        "simpleValueType": true,
        "defaultValue": "none"
      },
      {
        "type": "TEXT",
        "name": "nestedArray",
        "displayName": "Array Variable",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "nestedType",
            "paramValue": "object",
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "CHECKBOX",
        "name": "convertNested",
        "checkboxText": "Convert E-Commerce Items To \"nested\" Format",
        "simpleValueType": true,
        "defaultValue": false,
        "enablingConditions": [
          {
            "paramName": "nestedType",
            "paramValue": "none",
            "type": "NOT_EQUALS"
          }
        ],
        "help": "Check if you add a variable for \"ecommerce.items\" from a standard GA4 dataLayer. nested type will be \"product\"."
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const createArgumentsQueue = require('createArgumentsQueue');
const copyFromDataLayer = require('copyFromDataLayer');

// Initialize tracker objects, Matomo Analytics queue
let _elb = createArgumentsQueue('elb', 'elbLayer');

//e-commerce item conversion from standard GA4 dataLayer to "nested"
const convert2nested = function(eec) {
  if (!eec || typeof(eec) !== "object") return [];
  var src = eec;
  //do we have items / products or a complete ecommerce object?
  if (eec.ecommerce && eec.ecommerce.items) src = eec.ecommerce.items;
  else if (eec.items) src = eec.items;
  if (!src) return [];
  return src.map(function(x){
    return {
      type: "product",
      data: x
    };
  });
};

// define data
let dataObj = {};
if (data.dataType === "object") 
  dataObj = data.dataObject;
else if (data.dataType === "table") 
  data.dataTable.forEach(x => {
    dataObj[x.fieldName] = x.fieldValue;
  });
if (typeof(dataObj) !== "object") 
  dataObj = {};

// define context 
let contextObj = {};
if (data.contextType === "object") 
  contextObj = data.contextObject;
else if (data.contextType === "table") 
  data.contextTable.forEach(x => {
    contextObj[x.fieldName] = x.fieldValue;
  });
if (typeof(contextObj) !== "object") 
  contextObj = {};

let nestedArray;
if (data.nestedType === "object")  
  nestedArray = data.nestedArray;
else if (data.nestedType === "dataLayer")
  nestedArray = copyFromDataLayer("ecommerce.items");

if (nestedArray && (data.convertNested === true)) 
  nestedArray = convert2nested(nestedArray);

// send event
_elb(data.entity + " " + data.action, 
     dataObj,  
     data.trigger||"unknown", 
     contextObj,
     nestedArray||[]
);

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
        "publicId": "read_data_layer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "ecommerce.items"
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

Created on 5.12.2022, 00:08:05
