% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetStartTrigTerm(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetStartTrigTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetStartTrigTerm', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetStartTrigTerm', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetStartTrigTerm', taskHandle, data, bufferSize);
end
