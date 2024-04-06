% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetWriteSpaceAvail(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetWriteSpaceAvail', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetWriteSpaceAvail', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetWriteSpaceAvail', taskHandle, data);
end
