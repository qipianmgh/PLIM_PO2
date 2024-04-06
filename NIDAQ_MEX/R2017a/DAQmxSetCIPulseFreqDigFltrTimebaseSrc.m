% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetCIPulseFreqDigFltrTimebaseSrc(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIPulseFreqDigFltrTimebaseSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIPulseFreqDigFltrTimebaseSrc', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetCIPulseFreqDigFltrTimebaseSrc', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetCIPulseFreqDigFltrTimebaseSrc', taskHandle, channel, data);
end
