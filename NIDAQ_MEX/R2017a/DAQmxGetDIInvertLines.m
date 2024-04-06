% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDIInvertLines(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDIInvertLines', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetDIInvertLines', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDIInvertLines', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDIInvertLines', taskHandle, channel, data);
end
