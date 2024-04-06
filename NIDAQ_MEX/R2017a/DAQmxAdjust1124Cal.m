% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxAdjust1124Cal(calHandle, measOutput)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxAdjust1124Cal', 'calHandle', 1);
    validateattributes(measOutput, {'double'}, {'scalar'}, 'DAQmxAdjust1124Cal', 'measOutput', 2);
    [status]= mexNIDAQmx('DAQmxAdjust1124Cal', calHandle, measOutput);
end
