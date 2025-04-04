% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxAdjust4224Cal(calHandle, channelNames, gain, inputVal)
    narginchk(4, 4);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxAdjust4224Cal', 'calHandle', 1);
    validateattributes(channelNames, {'char'}, {'vector'}, 'DAQmxAdjust4224Cal', 'channelNames', 2);
    validateattributes(gain, {'double'}, {'scalar'}, 'DAQmxAdjust4224Cal', 'gain', 3);
    validateattributes(inputVal, {'double'}, {'scalar'}, 'DAQmxAdjust4224Cal', 'inputVal', 4);
    [status]= mexNIDAQmx('DAQmxAdjust4224Cal', calHandle, channelNames, gain, inputVal);
end
