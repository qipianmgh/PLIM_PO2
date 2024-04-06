% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetDigEdgeAdvTrigSrc(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigEdgeAdvTrigSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetDigEdgeAdvTrigSrc', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetDigEdgeAdvTrigSrc', taskHandle, data);
end
