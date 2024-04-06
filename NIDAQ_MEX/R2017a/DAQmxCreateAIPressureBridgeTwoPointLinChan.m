% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateAIPressureBridgeTwoPointLinChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, firstElectricalVal, secondElectricalVal, electricalUnits, firstPhysicalVal, secondPhysicalVal, physicalUnits, customScaleName)
    narginchk(17, 17);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAIPressureBridgeTwoPointLinChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAIPressureBridgeTwoPointLinChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAIPressureBridgeTwoPointLinChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateAIPressureBridgeTwoPointLinChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateAIPressureBridgeTwoPointLinChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateAIPressureBridgeTwoPointLinChan', 'units', 6);
    validateattributes(bridgeConfig, {'int32'}, {'scalar'}, 'DAQmxCreateAIPressureBridgeTwoPointLinChan', 'bridgeConfig', 7);
    validateattributes(voltageExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateAIPressureBridgeTwoPointLinChan', 'voltageExcitSource', 8);
    validateattributes(voltageExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateAIPressureBridgeTwoPointLinChan', 'voltageExcitVal', 9);
    validateattributes(nominalBridgeResistance, {'double'}, {'scalar'}, 'DAQmxCreateAIPressureBridgeTwoPointLinChan', 'nominalBridgeResistance', 10);
    validateattributes(firstElectricalVal, {'double'}, {'scalar'}, 'DAQmxCreateAIPressureBridgeTwoPointLinChan', 'firstElectricalVal', 11);
    validateattributes(secondElectricalVal, {'double'}, {'scalar'}, 'DAQmxCreateAIPressureBridgeTwoPointLinChan', 'secondElectricalVal', 12);
    validateattributes(electricalUnits, {'int32'}, {'scalar'}, 'DAQmxCreateAIPressureBridgeTwoPointLinChan', 'electricalUnits', 13);
    validateattributes(firstPhysicalVal, {'double'}, {'scalar'}, 'DAQmxCreateAIPressureBridgeTwoPointLinChan', 'firstPhysicalVal', 14);
    validateattributes(secondPhysicalVal, {'double'}, {'scalar'}, 'DAQmxCreateAIPressureBridgeTwoPointLinChan', 'secondPhysicalVal', 15);
    validateattributes(physicalUnits, {'int32'}, {'scalar'}, 'DAQmxCreateAIPressureBridgeTwoPointLinChan', 'physicalUnits', 16);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateAIPressureBridgeTwoPointLinChan', 'customScaleName', 17);
    [status]= mexNIDAQmx('DAQmxCreateAIPressureBridgeTwoPointLinChan', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, firstElectricalVal, secondElectricalVal, electricalUnits, firstPhysicalVal, secondPhysicalVal, physicalUnits, customScaleName);
end
