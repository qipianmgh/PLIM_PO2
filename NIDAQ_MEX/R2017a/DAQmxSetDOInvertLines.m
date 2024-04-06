% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDOInvertLines(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDOInvertLines', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetDOInvertLines', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetDOInvertLines', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetDOInvertLines', taskHandle, channel, data);
end
