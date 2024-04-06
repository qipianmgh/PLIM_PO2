% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateAICurrentChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, shuntResistorLoc, extShuntResistorVal, customScaleName)
    narginchk(10, 10);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAICurrentChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAICurrentChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAICurrentChan', 'nameToAssignToChannel', 3);
    validateattributes(terminalConfig, {'int32'}, {'scalar'}, 'DAQmxCreateAICurrentChan', 'terminalConfig', 4);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateAICurrentChan', 'minVal', 5);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateAICurrentChan', 'maxVal', 6);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateAICurrentChan', 'units', 7);
    validateattributes(shuntResistorLoc, {'int32'}, {'scalar'}, 'DAQmxCreateAICurrentChan', 'shuntResistorLoc', 8);
    validateattributes(extShuntResistorVal, {'double'}, {'scalar'}, 'DAQmxCreateAICurrentChan', 'extShuntResistorVal', 9);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateAICurrentChan', 'customScaleName', 10);
    [status]= mexNIDAQmx('DAQmxCreateAICurrentChan', taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, shuntResistorLoc, extShuntResistorVal, customScaleName);
end
