/**
 * Created by anderlu on 2016/6/8.
 */
package com.qcloud.utils {
import flash.external.ExternalInterface;

public class Safety {
    public function Safety() {
    }

    public static function checkObjectIdValid():Boolean{
        if (ExternalInterface.available)
        {
            var objectId:String = ExternalInterface.objectID;
            if (!objectId || (objectId == objectId.replace(/[^0-9a-zA-Z_]/g , "")))
                return true;
            else
                return false;
        }
        return true;
    }

    public static function checkJsFunctionValid(functionName:String):Boolean{
        var reg:RegExp = /^[a-zA-Z0-9_\.]+$/;
        return reg.test(functionName);
    }

    public static function filterXSS(str : String) : String{
        return str.replace(/[\"\\]/g, function(d:String, b:*, c:*):String{ return '\\' + d.charCodeAt(0).toString(8); });
    }

}
}
