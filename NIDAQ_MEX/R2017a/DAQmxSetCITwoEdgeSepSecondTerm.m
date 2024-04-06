% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetCITwoEdgeSepSecondTerm(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCITwoEdgeSepSecondTerm', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCITwoEdgeSepSecondTerm', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetCITwoEdgeSepSecondTerm', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetCITwoEdgeSepSecondTerm', taskHandle, channel, data);
end
