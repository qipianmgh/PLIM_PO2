% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetDigEdgeRefTrigSrc(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigEdgeRefTrigSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetDigEdgeRefTrigSrc', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetDigEdgeRefTrigSrc', taskHandle, data);
end
