/*
    Copies the preset by the given name.
    ["ACRE_RADIOTYPE", "srcPresetName", "dstPresetName"]
    
    ex:
    ["ACRE_PRC343", "default", "balls"] call acre_api_fnc_copyPreset;
*/
#include "script_component.hpp"

private ["_presetData", "_presetCopy"];
params ["_radioClass", "_srcPresetName", "_dstPresetName"];

_presetData = [_radioClass, _srcPresetName] call FUNC(getPresetData);
if(isNil "_presetData") exitWith { false };

_presetCopy = [_presetData] call FUNC(copyArray);

[_radioClass,_dstPresetName,_presetCopy] call EFUNC(sys_data,registerRadioPreset);

true