% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxAdjust4353Cal(calHandle, channelNames, refVal)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxAdjust4353Cal', 'calHandle', 1);
    validateattributes(channelNames, {'char'}, {'vector'}, 'DAQmxAdjust4353Cal', 'channelNames', 2);
    validateattributes(refVal, {'double'}, {'scalar'}, 'DAQmxAdjust4353Cal', 'refVal', 3);
    [status]= mexNIDAQmx('DAQmxAdjust4353Cal', calHandle, channelNames, refVal);
end
