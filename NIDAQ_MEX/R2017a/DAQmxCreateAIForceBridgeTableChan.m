% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateAIForceBridgeTableChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, electricalVals, numElectricalVals, electricalUnits, physicalVals, numPhysicalVals, physicalUnits, customScaleName)
    narginchk(17, 17);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAIForceBridgeTableChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAIForceBridgeTableChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAIForceBridgeTableChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateAIForceBridgeTableChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateAIForceBridgeTableChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateAIForceBridgeTableChan', 'units', 6);
    validateattributes(bridgeConfig, {'int32'}, {'scalar'}, 'DAQmxCreateAIForceBridgeTableChan', 'bridgeConfig', 7);
    validateattributes(voltageExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateAIForceBridgeTableChan', 'voltageExcitSource', 8);
    validateattributes(voltageExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateAIForceBridgeTableChan', 'voltageExcitVal', 9);
    validateattributes(nominalBridgeResistance, {'double'}, {'scalar'}, 'DAQmxCreateAIForceBridgeTableChan', 'nominalBridgeResistance', 10);
    validateattributes(electricalVals, {'double'}, {'vector'}, 'DAQmxCreateAIForceBridgeTableChan', 'electricalVals', 11);
    validateattributes(numElectricalVals, {'uint32'}, {'scalar'}, 'DAQmxCreateAIForceBridgeTableChan', 'numElectricalVals', 12);
    validateattributes(electricalUnits, {'int32'}, {'scalar'}, 'DAQmxCreateAIForceBridgeTableChan', 'electricalUnits', 13);
    validateattributes(physicalVals, {'double'}, {'vector'}, 'DAQmxCreateAIForceBridgeTableChan', 'physicalVals', 14);
    validateattributes(numPhysicalVals, {'uint32'}, {'scalar'}, 'DAQmxCreateAIForceBridgeTableChan', 'numPhysicalVals', 15);
    validateattributes(physicalUnits, {'int32'}, {'scalar'}, 'DAQmxCreateAIForceBridgeTableChan', 'physicalUnits', 16);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateAIForceBridgeTableChan', 'customScaleName', 17);
    [status]= mexNIDAQmx('DAQmxCreateAIForceBridgeTableChan', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, electricalVals, numElectricalVals, electricalUnits, physicalVals, numPhysicalVals, physicalUnits, customScaleName);
end
