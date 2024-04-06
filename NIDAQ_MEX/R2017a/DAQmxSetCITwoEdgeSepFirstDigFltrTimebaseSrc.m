% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetCITwoEdgeSepFirstDigFltrTimebaseSrc(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCITwoEdgeSepFirstDigFltrTimebaseSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCITwoEdgeSepFirstDigFltrTimebaseSrc', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetCITwoEdgeSepFirstDigFltrTimebaseSrc', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetCITwoEdgeSepFirstDigFltrTimebaseSrc', taskHandle, channel, data);
end
