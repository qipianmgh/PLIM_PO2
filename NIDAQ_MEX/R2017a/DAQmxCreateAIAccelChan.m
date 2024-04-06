% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateAIAccelChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, currentExcitSource, currentExcitVal, customScaleName)
    narginchk(12, 12);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAIAccelChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAIAccelChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAIAccelChan', 'nameToAssignToChannel', 3);
    validateattributes(terminalConfig, {'int32'}, {'scalar'}, 'DAQmxCreateAIAccelChan', 'terminalConfig', 4);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateAIAccelChan', 'minVal', 5);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateAIAccelChan', 'maxVal', 6);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateAIAccelChan', 'units', 7);
    validateattributes(sensitivity, {'double'}, {'scalar'}, 'DAQmxCreateAIAccelChan', 'sensitivity', 8);
    validateattributes(sensitivityUnits, {'int32'}, {'scalar'}, 'DAQmxCreateAIAccelChan', 'sensitivityUnits', 9);
    validateattributes(currentExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateAIAccelChan', 'currentExcitSource', 10);
    validateattributes(currentExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateAIAccelChan', 'currentExcitVal', 11);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateAIAccelChan', 'customScaleName', 12);
    [status]= mexNIDAQmx('DAQmxCreateAIAccelChan', taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, currentExcitSource, currentExcitVal, customScaleName);
end
