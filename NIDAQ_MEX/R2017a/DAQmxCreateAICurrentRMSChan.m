% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateAICurrentRMSChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, shuntResistorLoc, extShuntResistorVal, customScaleName)
    narginchk(10, 10);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAICurrentRMSChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAICurrentRMSChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAICurrentRMSChan', 'nameToAssignToChannel', 3);
    validateattributes(terminalConfig, {'int32'}, {'scalar'}, 'DAQmxCreateAICurrentRMSChan', 'terminalConfig', 4);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateAICurrentRMSChan', 'minVal', 5);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateAICurrentRMSChan', 'maxVal', 6);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateAICurrentRMSChan', 'units', 7);
    validateattributes(shuntResistorLoc, {'int32'}, {'scalar'}, 'DAQmxCreateAICurrentRMSChan', 'shuntResistorLoc', 8);
    validateattributes(extShuntResistorVal, {'double'}, {'scalar'}, 'DAQmxCreateAICurrentRMSChan', 'extShuntResistorVal', 9);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateAICurrentRMSChan', 'customScaleName', 10);
    [status]= mexNIDAQmx('DAQmxCreateAICurrentRMSChan', taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, shuntResistorLoc, extShuntResistorVal, customScaleName);
end
