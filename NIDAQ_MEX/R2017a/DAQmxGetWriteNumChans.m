% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetWriteNumChans(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetWriteNumChans', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetWriteNumChans', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetWriteNumChans', taskHandle, data);
end
