% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCITwoEdgeSepFirstTerm(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCITwoEdgeSepFirstTerm', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCITwoEdgeSepFirstTerm', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCITwoEdgeSepFirstTerm', taskHandle, channel);
end
