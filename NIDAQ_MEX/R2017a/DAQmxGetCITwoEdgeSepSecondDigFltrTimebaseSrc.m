% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCITwoEdgeSepSecondDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCITwoEdgeSepSecondDigFltrTimebaseSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCITwoEdgeSepSecondDigFltrTimebaseSrc', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetCITwoEdgeSepSecondDigFltrTimebaseSrc', 'data', 3);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetCITwoEdgeSepSecondDigFltrTimebaseSrc', 'bufferSize', 4);
    [status, data]= mexNIDAQmx('DAQmxGetCITwoEdgeSepSecondDigFltrTimebaseSrc', taskHandle, channel, data, bufferSize);
end
