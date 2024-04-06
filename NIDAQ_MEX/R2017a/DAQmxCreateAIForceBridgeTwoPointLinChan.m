% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateAIForceBridgeTwoPointLinChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, firstElectricalVal, secondElectricalVal, electricalUnits, firstPhysicalVal, secondPhysicalVal, physicalUnits, customScaleName)
    narginchk(17, 17);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAIForceBridgeTwoPointLinChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAIForceBridgeTwoPointLinChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAIForceBridgeTwoPointLinChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateAIForceBridgeTwoPointLinChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateAIForceBridgeTwoPointLinChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateAIForceBridgeTwoPointLinChan', 'units', 6);
    validateattributes(bridgeConfig, {'int32'}, {'scalar'}, 'DAQmxCreateAIForceBridgeTwoPointLinChan', 'bridgeConfig', 7);
    validateattributes(voltageExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateAIForceBridgeTwoPointLinChan', 'voltageExcitSource', 8);
    validateattributes(voltageExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateAIForceBridgeTwoPointLinChan', 'voltageExcitVal', 9);
    validateattributes(nominalBridgeResistance, {'double'}, {'scalar'}, 'DAQmxCreateAIForceBridgeTwoPointLinChan', 'nominalBridgeResistance', 10);
    validateattributes(firstElectricalVal, {'double'}, {'scalar'}, 'DAQmxCreateAIForceBridgeTwoPointLinChan', 'firstElectricalVal', 11);
    validateattributes(secondElectricalVal, {'double'}, {'scalar'}, 'DAQmxCreateAIForceBridgeTwoPointLinChan', 'secondElectricalVal', 12);
    validateattributes(electricalUnits, {'int32'}, {'scalar'}, 'DAQmxCreateAIForceBridgeTwoPointLinChan', 'electricalUnits', 13);
    validateattributes(firstPhysicalVal, {'double'}, {'scalar'}, 'DAQmxCreateAIForceBridgeTwoPointLinChan', 'firstPhysicalVal', 14);
    validateattributes(secondPhysicalVal, {'double'}, {'scalar'}, 'DAQmxCreateAIForceBridgeTwoPointLinChan', 'secondPhysicalVal', 15);
    validateattributes(physicalUnits, {'int32'}, {'scalar'}, 'DAQmxCreateAIForceBridgeTwoPointLinChan', 'physicalUnits', 16);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateAIForceBridgeTwoPointLinChan', 'customScaleName', 17);
    [status]= mexNIDAQmx('DAQmxCreateAIForceBridgeTwoPointLinChan', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, firstElectricalVal, secondElectricalVal, electricalUnits, firstPhysicalVal, secondPhysicalVal, physicalUnits, customScaleName);
end
