% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateTEDSAIAccelChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, currentExcitSource, currentExcitVal, customScaleName)
    narginchk(10, 10);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateTEDSAIAccelChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIAccelChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIAccelChan', 'nameToAssignToChannel', 3);
    validateattributes(terminalConfig, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIAccelChan', 'terminalConfig', 4);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIAccelChan', 'minVal', 5);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIAccelChan', 'maxVal', 6);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIAccelChan', 'units', 7);
    validateattributes(currentExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIAccelChan', 'currentExcitSource', 8);
    validateattributes(currentExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIAccelChan', 'currentExcitVal', 9);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIAccelChan', 'customScaleName', 10);
    [status]= mexNIDAQmx('DAQmxCreateTEDSAIAccelChan', taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, currentExcitSource, currentExcitVal, customScaleName);
end
