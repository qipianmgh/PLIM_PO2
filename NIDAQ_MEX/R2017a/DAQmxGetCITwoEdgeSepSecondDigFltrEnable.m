% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCITwoEdgeSepSecondDigFltrEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCITwoEdgeSepSecondDigFltrEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCITwoEdgeSepSecondDigFltrEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCITwoEdgeSepSecondDigFltrEnable', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCITwoEdgeSepSecondDigFltrEnable', taskHandle, channel, data);
end
