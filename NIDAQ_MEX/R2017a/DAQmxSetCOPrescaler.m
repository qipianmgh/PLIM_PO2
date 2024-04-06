% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCOPrescaler(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCOPrescaler', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCOPrescaler', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCOPrescaler', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCOPrescaler', taskHandle, channel, data);
end
