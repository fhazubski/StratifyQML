/* JSONListModel - a QML ListModel with JSON and JSONPath support
 *
 * Copyright (c) 2012 Romain Pokrzywka (KDAB) (romain@kdab.com)
 * Licensed under the MIT licence (http://opensource.org/licenses/mit-license.php)
 */

import QtQuick 2.5
import "jsonpath-0.8.5.js" as JSONPath

Item {
    property string source: ""
    property string json: ""
    property string query: ""

    property ListModel model : ListModel { id: jsonModel }
    property alias count: jsonModel.count

    onSourceChanged: {
        var xhr = new XMLHttpRequest;
        xhr.open("GET", source);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE){
                json = xhr.responseText;
            }
        }
        xhr.send();
    }

    onJsonChanged: updateJSONModel()
    onQueryChanged: updateJSONModel()

    function updateJSONModel() {
        jsonModel.clear();

        if ( json === "" ){
            return;
        }

        //console.log("JSON:" + json);

        var objectArray = parseJSONString(json, query);
        for ( var key in objectArray ) {
            var jo = objectArray[key];
            if( jo.toString() === "[object Object]"){
                jsonModel.append( jo );
            } else {
                //this is comma separated strings
                var str = jo.toString().split(",");
                for(var i = 0; i < str.length; i++){
                    jsonModel.append({ "item": str[i] } );
                }
                break;
            }
        }
    }

    function parseJSONString(jsonString, jsonPathQuery) {
        console.log("String is " + jsonString);
        var objectArray = JSON.parse(jsonString);
        if ( jsonPathQuery !== "" ){
            objectArray = JSONPath.jsonPath(objectArray, jsonPathQuery);
        }
        return objectArray;
    }
}
