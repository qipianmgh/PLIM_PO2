% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateTEDSAICurrentChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, shuntResistorLoc, extShuntResistorVal, customScaleName)
    narginchk(10, 10);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateTEDSAICurrentChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAICurrentChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAICurrentChan', 'nameToAssignToChannel', 3);
    validateattributes(terminalConfig, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAICurrentChan', 'terminalConfig', 4);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAICurrentChan', 'minVal', 5);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAICurrentChan', 'maxVal', 6);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAICurrentChan', 'units', 7);
    validateattributes(shuntResistorLoc, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAICurrentChan', 'shuntResistorLoc', 8);
    validateattributes(extShuntResistorVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAICurrentChan', 'extShuntResistorVal', 9);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateTEDSAICurrentChan', 'customScaleName', 10);
    [status]= mexNIDAQmx('DAQmxCreateTEDSAICurrentChan', taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, shuntResistorLoc, extShuntResistorVal, customScaleName);
end
