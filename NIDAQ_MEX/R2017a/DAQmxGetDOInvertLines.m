% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDOInvertLines(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDOInvertLines', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetDOInvertLines', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDOInvertLines', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDOInvertLines', taskHandle, channel, data);
end
