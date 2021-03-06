/*
Copyright 2016 Tyler Gilbert

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/

import QtQuick 2.5
import "SCustomize.js" as Theme

SBaseRectangleText {
    id: button;
    type: "label";

    bg_color: Theme.label_default_bg;
    text_color: Theme.label_color;
    border_color: Theme.label_default_bg;

    onStyleChanged: {
        var items = parseStyle();
        radius = Theme.btn_border_radius_base;
        for(var i = 0; i < items.length; i++){
            if( items[i] === "primary" ){
                bg_color = Theme.label_primary_bg;
                border_color = Theme.label_primary_bg;
            } else if( items[i] === "default" ){
                bg_color = Theme.label_default_bg;
                border_color = Theme.label_default_bg;
            } else if( items[i] === "danger" ){
                bg_color = Theme.label_danger_bg;
                border_color = Theme.label_danger_bg;
            } else if( items[i] === "success" ){
                bg_color = Theme.label_success_bg;
                border_color = Theme.label_success_bg;
            } else if( items[i] === "info" ){
                bg_color = Theme.label_info_bg;
                border_color = Theme.label_info_bg;
            } else if( items[i] === "warning" ){
                bg_color = Theme.label_warning_bg;
                border_color = Theme.label_warning_bg;
            }

        }
    }

    contents.data: [
        MouseArea {
            anchors.fill: parent;
            hoverEnabled: true;
            onEntered: startHover();
            onExited: stopHover();
        }
    ]

}
