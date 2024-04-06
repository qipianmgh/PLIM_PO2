% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIPeriodDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIPeriodDigFltrTimebaseSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIPeriodDigFltrTimebaseSrc', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetCIPeriodDigFltrTimebaseSrc', 'data', 3);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetCIPeriodDigFltrTimebaseSrc', 'bufferSize', 4);
    [status, data]= mexNIDAQmx('DAQmxGetCIPeriodDigFltrTimebaseSrc', taskHandle, channel, data, bufferSize);
end
