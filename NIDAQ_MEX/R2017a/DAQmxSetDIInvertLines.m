% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDIInvertLines(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDIInvertLines', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetDIInvertLines', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetDIInvertLines', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetDIInvertLines', taskHandle, channel, data);
end
