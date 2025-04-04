% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCITwoEdgeSepFirstDigFltrTimebaseRate(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCITwoEdgeSepFirstDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCITwoEdgeSepFirstDigFltrTimebaseRate', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetCITwoEdgeSepFirstDigFltrTimebaseRate', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCITwoEdgeSepFirstDigFltrTimebaseRate', taskHandle, channel, data);
end
