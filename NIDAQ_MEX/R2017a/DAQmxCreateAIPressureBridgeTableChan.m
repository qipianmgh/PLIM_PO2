% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateAIPressureBridgeTableChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, electricalVals, numElectricalVals, electricalUnits, physicalVals, numPhysicalVals, physicalUnits, customScaleName)
    narginchk(17, 17);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAIPressureBridgeTableChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAIPressureBridgeTableChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAIPressureBridgeTableChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateAIPressureBridgeTableChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateAIPressureBridgeTableChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateAIPressureBridgeTableChan', 'units', 6);
    validateattributes(bridgeConfig, {'int32'}, {'scalar'}, 'DAQmxCreateAIPressureBridgeTableChan', 'bridgeConfig', 7);
    validateattributes(voltageExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateAIPressureBridgeTableChan', 'voltageExcitSource', 8);
    validateattributes(voltageExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateAIPressureBridgeTableChan', 'voltageExcitVal', 9);
    validateattributes(nominalBridgeResistance, {'double'}, {'scalar'}, 'DAQmxCreateAIPressureBridgeTableChan', 'nominalBridgeResistance', 10);
    validateattributes(electricalVals, {'double'}, {'vector'}, 'DAQmxCreateAIPressureBridgeTableChan', 'electricalVals', 11);
    validateattributes(numElectricalVals, {'uint32'}, {'scalar'}, 'DAQmxCreateAIPressureBridgeTableChan', 'numElectricalVals', 12);
    validateattributes(electricalUnits, {'int32'}, {'scalar'}, 'DAQmxCreateAIPressureBridgeTableChan', 'electricalUnits', 13);
    validateattributes(physicalVals, {'double'}, {'vector'}, 'DAQmxCreateAIPressureBridgeTableChan', 'physicalVals', 14);
    validateattributes(numPhysicalVals, {'uint32'}, {'scalar'}, 'DAQmxCreateAIPressureBridgeTableChan', 'numPhysicalVals', 15);
    validateattributes(physicalUnits, {'int32'}, {'scalar'}, 'DAQmxCreateAIPressureBridgeTableChan', 'physicalUnits', 16);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateAIPressureBridgeTableChan', 'customScaleName', 17);
    [status]= mexNIDAQmx('DAQmxCreateAIPressureBridgeTableChan', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, electricalVals, numElectricalVals, electricalUnits, physicalVals, numPhysicalVals, physicalUnits, customScaleName);
end
