% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDONumLines(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDONumLines', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetDONumLines', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDONumLines', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDONumLines', taskHandle, channel, data);
end
