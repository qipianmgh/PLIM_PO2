% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateTEDSAIStrainGageChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, initialBridgeVoltage, leadWireResistance, customScaleName)
    narginchk(11, 11);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateTEDSAIStrainGageChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIStrainGageChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIStrainGageChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIStrainGageChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIStrainGageChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIStrainGageChan', 'units', 6);
    validateattributes(voltageExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIStrainGageChan', 'voltageExcitSource', 7);
    validateattributes(voltageExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIStrainGageChan', 'voltageExcitVal', 8);
    validateattributes(initialBridgeVoltage, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIStrainGageChan', 'initialBridgeVoltage', 9);
    validateattributes(leadWireResistance, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIStrainGageChan', 'leadWireResistance', 10);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIStrainGageChan', 'customScaleName', 11);
    [status]= mexNIDAQmx('DAQmxCreateTEDSAIStrainGageChan', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, initialBridgeVoltage, leadWireResistance, customScaleName);
end
