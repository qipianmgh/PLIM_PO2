% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateAITorqueBridgeTableChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, electricalVals, numElectricalVals, electricalUnits, physicalVals, numPhysicalVals, physicalUnits, customScaleName)
    narginchk(17, 17);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAITorqueBridgeTableChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAITorqueBridgeTableChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAITorqueBridgeTableChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateAITorqueBridgeTableChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateAITorqueBridgeTableChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateAITorqueBridgeTableChan', 'units', 6);
    validateattributes(bridgeConfig, {'int32'}, {'scalar'}, 'DAQmxCreateAITorqueBridgeTableChan', 'bridgeConfig', 7);
    validateattributes(voltageExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateAITorqueBridgeTableChan', 'voltageExcitSource', 8);
    validateattributes(voltageExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateAITorqueBridgeTableChan', 'voltageExcitVal', 9);
    validateattributes(nominalBridgeResistance, {'double'}, {'scalar'}, 'DAQmxCreateAITorqueBridgeTableChan', 'nominalBridgeResistance', 10);
    validateattributes(electricalVals, {'double'}, {'vector'}, 'DAQmxCreateAITorqueBridgeTableChan', 'electricalVals', 11);
    validateattributes(numElectricalVals, {'uint32'}, {'scalar'}, 'DAQmxCreateAITorqueBridgeTableChan', 'numElectricalVals', 12);
    validateattributes(electricalUnits, {'int32'}, {'scalar'}, 'DAQmxCreateAITorqueBridgeTableChan', 'electricalUnits', 13);
    validateattributes(physicalVals, {'double'}, {'vector'}, 'DAQmxCreateAITorqueBridgeTableChan', 'physicalVals', 14);
    validateattributes(numPhysicalVals, {'uint32'}, {'scalar'}, 'DAQmxCreateAITorqueBridgeTableChan', 'numPhysicalVals', 15);
    validateattributes(physicalUnits, {'int32'}, {'scalar'}, 'DAQmxCreateAITorqueBridgeTableChan', 'physicalUnits', 16);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateAITorqueBridgeTableChan', 'customScaleName', 17);
    [status]= mexNIDAQmx('DAQmxCreateAITorqueBridgeTableChan', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, electricalVals, numElectricalVals, electricalUnits, physicalVals, numPhysicalVals, physicalUnits, customScaleName);
end
