% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDINumLines(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDINumLines', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetDINumLines', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDINumLines', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDINumLines', taskHandle, channel, data);
end
