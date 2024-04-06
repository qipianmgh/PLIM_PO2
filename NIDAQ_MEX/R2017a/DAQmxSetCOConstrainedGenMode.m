% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCOConstrainedGenMode(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCOConstrainedGenMode', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCOConstrainedGenMode', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetCOConstrainedGenMode', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCOConstrainedGenMode', taskHandle, channel, data);
end
