% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetTaskNumChans(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetTaskNumChans', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetTaskNumChans', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetTaskNumChans', taskHandle, data);
end
