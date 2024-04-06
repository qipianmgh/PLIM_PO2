% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetCIPulseWidthTerm(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIPulseWidthTerm', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIPulseWidthTerm', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetCIPulseWidthTerm', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetCIPulseWidthTerm', taskHandle, channel, data);
end
