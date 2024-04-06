% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetCITwoEdgeSepFirstTerm(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCITwoEdgeSepFirstTerm', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCITwoEdgeSepFirstTerm', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetCITwoEdgeSepFirstTerm', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetCITwoEdgeSepFirstTerm', taskHandle, channel, data);
end
