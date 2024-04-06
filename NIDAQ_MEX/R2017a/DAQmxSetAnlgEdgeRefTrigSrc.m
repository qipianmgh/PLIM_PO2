% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetAnlgEdgeRefTrigSrc(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgEdgeRefTrigSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetAnlgEdgeRefTrigSrc', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetAnlgEdgeRefTrigSrc', taskHandle, data);
end
