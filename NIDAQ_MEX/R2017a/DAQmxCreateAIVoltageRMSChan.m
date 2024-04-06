% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateAIVoltageRMSChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName)
    narginchk(8, 8);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAIVoltageRMSChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAIVoltageRMSChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAIVoltageRMSChan', 'nameToAssignToChannel', 3);
    validateattributes(terminalConfig, {'int32'}, {'scalar'}, 'DAQmxCreateAIVoltageRMSChan', 'terminalConfig', 4);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateAIVoltageRMSChan', 'minVal', 5);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateAIVoltageRMSChan', 'maxVal', 6);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateAIVoltageRMSChan', 'units', 7);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateAIVoltageRMSChan', 'customScaleName', 8);
    [status]= mexNIDAQmx('DAQmxCreateAIVoltageRMSChan', taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName);
end
