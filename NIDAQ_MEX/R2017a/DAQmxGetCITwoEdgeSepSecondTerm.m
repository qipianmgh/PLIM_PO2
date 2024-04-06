% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCITwoEdgeSepSecondTerm(taskHandle, channel, data, bufferSize)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCITwoEdgeSepSecondTerm', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCITwoEdgeSepSecondTerm', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetCITwoEdgeSepSecondTerm', 'data', 3);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetCITwoEdgeSepSecondTerm', 'bufferSize', 4);
    [status, data]= mexNIDAQmx('DAQmxGetCITwoEdgeSepSecondTerm', taskHandle, channel, data, bufferSize);
end
