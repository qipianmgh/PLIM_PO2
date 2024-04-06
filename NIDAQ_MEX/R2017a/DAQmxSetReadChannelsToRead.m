% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetReadChannelsToRead(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetReadChannelsToRead', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetReadChannelsToRead', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetReadChannelsToRead', taskHandle, data);
end
