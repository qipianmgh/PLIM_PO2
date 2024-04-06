% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateTEDSAIVoltageChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName)
    narginchk(8, 8);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateTEDSAIVoltageChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIVoltageChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIVoltageChan', 'nameToAssignToChannel', 3);
    validateattributes(terminalConfig, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIVoltageChan', 'terminalConfig', 4);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIVoltageChan', 'minVal', 5);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIVoltageChan', 'maxVal', 6);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIVoltageChan', 'units', 7);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIVoltageChan', 'customScaleName', 8);
    [status]= mexNIDAQmx('DAQmxCreateTEDSAIVoltageChan', taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName);
end
