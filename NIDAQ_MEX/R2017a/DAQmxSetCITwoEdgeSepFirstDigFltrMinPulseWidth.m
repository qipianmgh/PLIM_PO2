% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCITwoEdgeSepFirstDigFltrMinPulseWidth(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCITwoEdgeSepFirstDigFltrMinPulseWidth', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCITwoEdgeSepFirstDigFltrMinPulseWidth', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetCITwoEdgeSepFirstDigFltrMinPulseWidth', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCITwoEdgeSepFirstDigFltrMinPulseWidth', taskHandle, channel, data);
end
