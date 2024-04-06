% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateAITorqueBridgeTwoPointLinChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, firstElectricalVal, secondElectricalVal, electricalUnits, firstPhysicalVal, secondPhysicalVal, physicalUnits, customScaleName)
    narginchk(17, 17);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAITorqueBridgeTwoPointLinChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAITorqueBridgeTwoPointLinChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAITorqueBridgeTwoPointLinChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateAITorqueBridgeTwoPointLinChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateAITorqueBridgeTwoPointLinChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateAITorqueBridgeTwoPointLinChan', 'units', 6);
    validateattributes(bridgeConfig, {'int32'}, {'scalar'}, 'DAQmxCreateAITorqueBridgeTwoPointLinChan', 'bridgeConfig', 7);
    validateattributes(voltageExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateAITorqueBridgeTwoPointLinChan', 'voltageExcitSource', 8);
    validateattributes(voltageExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateAITorqueBridgeTwoPointLinChan', 'voltageExcitVal', 9);
    validateattributes(nominalBridgeResistance, {'double'}, {'scalar'}, 'DAQmxCreateAITorqueBridgeTwoPointLinChan', 'nominalBridgeResistance', 10);
    validateattributes(firstElectricalVal, {'double'}, {'scalar'}, 'DAQmxCreateAITorqueBridgeTwoPointLinChan', 'firstElectricalVal', 11);
    validateattributes(secondElectricalVal, {'double'}, {'scalar'}, 'DAQmxCreateAITorqueBridgeTwoPointLinChan', 'secondElectricalVal', 12);
    validateattributes(electricalUnits, {'int32'}, {'scalar'}, 'DAQmxCreateAITorqueBridgeTwoPointLinChan', 'electricalUnits', 13);
    validateattributes(firstPhysicalVal, {'double'}, {'scalar'}, 'DAQmxCreateAITorqueBridgeTwoPointLinChan', 'firstPhysicalVal', 14);
    validateattributes(secondPhysicalVal, {'double'}, {'scalar'}, 'DAQmxCreateAITorqueBridgeTwoPointLinChan', 'secondPhysicalVal', 15);
    validateattributes(physicalUnits, {'int32'}, {'scalar'}, 'DAQmxCreateAITorqueBridgeTwoPointLinChan', 'physicalUnits', 16);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateAITorqueBridgeTwoPointLinChan', 'customScaleName', 17);
    [status]= mexNIDAQmx('DAQmxCreateAITorqueBridgeTwoPointLinChan', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, firstElectricalVal, secondElectricalVal, electricalUnits, firstPhysicalVal, secondPhysicalVal, physicalUnits, customScaleName);
end
