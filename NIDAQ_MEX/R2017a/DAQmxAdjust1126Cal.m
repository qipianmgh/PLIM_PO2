% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxAdjust1126Cal(calHandle, refFreq, measOutput)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxAdjust1126Cal', 'calHandle', 1);
    validateattributes(refFreq, {'double'}, {'scalar'}, 'DAQmxAdjust1126Cal', 'refFreq', 2);
    validateattributes(measOutput, {'double'}, {'scalar'}, 'DAQmxAdjust1126Cal', 'measOutput', 3);
    [status]= mexNIDAQmx('DAQmxAdjust1126Cal', calHandle, refFreq, measOutput);
end
