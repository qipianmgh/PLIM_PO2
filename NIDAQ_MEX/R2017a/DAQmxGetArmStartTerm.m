% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetArmStartTerm(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetArmStartTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetArmStartTerm', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetArmStartTerm', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetArmStartTerm', taskHandle, data, bufferSize);
end
