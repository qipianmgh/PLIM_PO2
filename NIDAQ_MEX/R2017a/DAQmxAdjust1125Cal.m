% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxAdjust1125Cal(calHandle, refVoltage, measOutput)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxAdjust1125Cal', 'calHandle', 1);
    validateattributes(refVoltage, {'double'}, {'scalar'}, 'DAQmxAdjust1125Cal', 'refVoltage', 2);
    validateattributes(measOutput, {'double'}, {'scalar'}, 'DAQmxAdjust1125Cal', 'measOutput', 3);
    [status]= mexNIDAQmx('DAQmxAdjust1125Cal', calHandle, refVoltage, measOutput);
end
