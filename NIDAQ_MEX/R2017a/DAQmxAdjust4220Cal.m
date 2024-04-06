% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxAdjust4220Cal(calHandle, channelNames, gain, inputVal)
    narginchk(4, 4);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxAdjust4220Cal', 'calHandle', 1);
    validateattributes(channelNames, {'char'}, {'vector'}, 'DAQmxAdjust4220Cal', 'channelNames', 2);
    validateattributes(gain, {'double'}, {'scalar'}, 'DAQmxAdjust4220Cal', 'gain', 3);
    validateattributes(inputVal, {'double'}, {'scalar'}, 'DAQmxAdjust4220Cal', 'inputVal', 4);
    [status]= mexNIDAQmx('DAQmxAdjust4220Cal', calHandle, channelNames, gain, inputVal);
end
