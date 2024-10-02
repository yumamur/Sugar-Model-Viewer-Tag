___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "categories": ["PERSONALIZATION", "MARKETING"],
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Sugar Model Viewer",
  "brand": {
    "id": "brand_dummy",
    "displayName": ""
  },
  "description": "Automatically enable Sugar Model Viewer within minutes, if not seconds",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "companyId",
    "displayName": "Company ID",
    "simpleValueType": true,
    "notSetText": "This is required",
    "valueValidators": [
      {
        "type": "POSITIVE_NUMBER"
      }
    ],
    "valueHint": "The id given by Sugar Tech",
    "alwaysInSummary": true
  },
  {
    "type": "TEXT",
    "name": "containerId",
    "displayName": "Sugar Model Viewer Container Id",
    "simpleValueType": true,
    "notSetText": "This is required",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "valueHint": "Html element to place the viewer in",
    "alwaysInSummary": true
  },
  {
    "type": "SELECT",
    "name": "method",
    "displayName": "Where to get Product SKU?",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "from-uri",
        "displayValue": "From URL"
      },
      {
        "value": "from-html",
        "displayValue": "From an HTML element"
      }
    ],
    "simpleValueType": true,
    "subParams": [
      {
        "type": "SELECT",
        "name": "method.uri",
        "displayName": "Where in URL",
        "macrosInSelect": false,
        "selectItems": [
          {
            "value": "end",
            "displayValue": "Last name of the path"
          },
          {
            "value": "param",
            "displayValue": "Query Parameter"
          }
        ],
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "method",
            "paramValue": "from-uri",
            "type": "EQUALS"
          }
        ],
        "subParams": [
          {
            "type": "TEXT",
            "name": "method.uri.param",
            "displayName": "Parameter Name",
            "simpleValueType": true,
            "enablingConditions": [
              {
                "paramName": "method.uri",
                "paramValue": "param",
                "type": "EQUALS"
              }
            ],
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              },
              {
                "type": "REGEX",
                "args": [
                  "^[A-Za-z0-9\\-._~]+$"
                ]
              }
            ],
            "notSetText": "Parameter name is required for current selection"
          }
        ],
        "help": "\u0027https://example.com/chairs/my-chair-sku\u0027 has \u0027/my-chair-sku\u0027 the SKU as the last name of path. And\n\u0027https://example.com/chairs?SKU\u003dmy-chair-sku\u0027 has \u0027SKU\u0027 parameter for it"
      },
      {
        "type": "SELECT",
        "name": "method.element",
        "displayName": "How to find it in document?",
        "macrosInSelect": false,
        "selectItems": [
          {
            "value": "id",
            "displayValue": "Element ID"
          },
          {
            "value": "custom",
            "displayValue": "Custom Query"
          }
        ],
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "method",
            "paramValue": "from-html",
            "type": "EQUALS"
          }
        ],
        "subParams": [
          {
            "type": "TEXT",
            "name": "method.element.id",
            "displayName": "ID of the element",
            "simpleValueType": true,
            "enablingConditions": [
              {
                "paramName": "method.element",
                "paramValue": "id",
                "type": "EQUALS"
              }
            ],
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              },
              {
                "type": "REGEX",
                "args": [
                  "^[A-Za-z_][A-Za-z0-9\\-_\\.]*$"
                ]
              }
            ],
            "notSetText": "An \u0027id\u0027 is required for current selection"
          },
          {
            "type": "TEXT",
            "name": "method.element.custom",
            "displayName": "Custom Selector",
            "simpleValueType": true,
            "enablingConditions": [
              {
                "paramName": "method.element",
                "paramValue": "custom",
                "type": "EQUALS"
              }
            ],
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              },
              {
                "type": "REGEX",
                "args": [
                  "^[a-zA-Z][a-zA-Z0-9]*|^#[a-zA-Z][a-zA-Z0-9\\-_]*|^\\.[a-zA-Z][a-zA-Z0-9\\-_]*|^\\[[a-zA-Z][a-zA-Z0-9\\-]*(?:\u003d\"[^\"]*\")?\\]$"
                ]
              }
            ],
            "notSetText": "A \u0027query\u0027 is required for current selection"
          },
          {
            "type": "SELECT",
            "name": "method.element.attribute",
            "displayName": "Which attribute contains it?",
            "selectItems": [
              {
                "value": "innerText",
                "displayValue": "Inner Text"
              },
              {
                "value": "data-product-id",
                "displayValue": "data-product-id"
              },
              {
                "value": "custom",
                "displayValue": "Custom Attribute"
              }
            ],
            "simpleValueType": true,
            "enablingConditions": [
              {
                "paramName": "method.element",
                "paramValue": "",
                "type": "PRESENT"
              }
            ],
            "subParams": [
              {
                "type": "TEXT",
                "name": "method.element.attribute.name",
                "displayName": "Attribute Name",
                "simpleValueType": true,
                "enablingConditions": [
                  {
                    "paramName": "method.element.attribute",
                    "paramValue": "custom",
                    "type": "EQUALS"
                  }
                ],
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^[A-Za-z][A-Za-z0-9\\-_:.]*$"
                    ]
                  }
                ],
                "notSetText": "Attribute name is required for current selection"
              }
            ]
          }
        ]
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "config",
    "displayName": "Customisation",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "config.isPopup",
        "checkboxText": "Show as Popup",
        "simpleValueType": true
      },
      {
        "type": "CHECKBOX",
        "name": "config.isPanelEnabled",
        "checkboxText": "Enable Configuration Panel",
        "simpleValueType": true
      },
      {
        "type": "TEXT",
        "name": "config.color",
        "displayName": "Theme Color",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          },
          {
            "type": "STRING_LENGTH",
            "args": [
              3
            ]
          }
        ],
        "valueHint": "\u0027white\u0027, \u0027aqua\u0027, \u0027#99CEAD\u0027"
      },
      {
        "type": "CHECKBOX",
        "name": "config.isDimensionsButtonEnabled",
        "checkboxText": "Enable Dimensions Toggle",
        "simpleValueType": true
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const injectScript = require('injectScript');
const createQueue = require('createQueue');
const log = require('logToConsole');
const getQueryParameters = require('getQueryParameters');
const getUrl = require('getUrl');
const toBase64 = require('toBase64');

function getSelector() {
  if (data['method.element'] != undefined) {
    switch(data['method.element']) {
      case "by-id":
        return "#" + data['method.element.id'];
      case "custom":
        return data['method.element.custom'];
      default:
        return undefined;
    }
  }
}

function getAttribute() {
  if (data['method.element.attribute'] == 'custom')
    return data['method.element.attribute.name'];
  else
    return data['method.element.attribute'];
}

function extractFromUri() {
  if (data['method.uri'] == undefined) return undefined;

  switch (data['method.uri']) {
    case "end":
      return getUrl('path').split('/').pop();
    case "param":
      return getQueryParameters(data['method.uri.param'], false);
    default:
      return undefined;
  }
}

function getConfiguration() {
  return toBase64(({
    isPopup: data['config.isPopup'],
    popupButtonId: data.containerId,
    isPanelEnabled: data['config.isPanelEnabled'],
    isDimensionsButtonEnabled: data['config.isDimensionsButtonEnabled'],
    color: data['config.color'],
  }).toString());
}

const productId = extractFromUri();
const selector = productId == undefined ? getSelector() : undefined;
const attribute = selector == undefined ? undefined : getAttribute();
const configuration = getConfiguration();

log(configuration);

createQueue('dataLayer')({
  'sugar': {
    'companyId': data.companyId,
    'containerId': data.containerId,
    'productId': productId,
    'needsSelector': productId == undefined,
    'selector': selector,
    'attribute': attribute,
    'configuration': configuration
  }
});

injectScript(
  "https://s3.eu-central-1.amazonaws.com/cdn.sugartech/test_tagmanager.js",
  function () {
    log("success");
  },
  function () {
    log("failure");
    data.gtmOnFailure();
  }
);

data.gtmOnSuccess();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
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
                "string": "https://s3.eu-central-1.amazonaws.com/cdn.sugartech/*"
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
                    "string": "dataLayer"
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
        "publicId": "get_url",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urlParts",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "queriesAllowed",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 16/08/2024, 16:13:02


