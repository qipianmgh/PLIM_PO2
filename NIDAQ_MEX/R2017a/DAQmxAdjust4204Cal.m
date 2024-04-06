% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxAdjust4204Cal(calHandle, channelNames, lowPassFreq, trackHoldEnabled, inputVal)
    narginchk(5, 5);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxAdjust4204Cal', 'calHandle', 1);
    validateattributes(channelNames, {'char'}, {'vector'}, 'DAQmxAdjust4204Cal', 'channelNames', 2);
    validateattributes(lowPassFreq, {'double'}, {'scalar'}, 'DAQmxAdjust4204Cal', 'lowPassFreq', 3);
    validateattributes(trackHoldEnabled, {'uint32'}, {'scalar'}, 'DAQmxAdjust4204Cal', 'trackHoldEnabled', 4);
    validateattributes(inputVal, {'double'}, {'scalar'}, 'DAQmxAdjust4204Cal', 'inputVal', 5);
    [status]= mexNIDAQmx('DAQmxAdjust4204Cal', calHandle, channelNames, lowPassFreq, trackHoldEnabled, inputVal);
end
