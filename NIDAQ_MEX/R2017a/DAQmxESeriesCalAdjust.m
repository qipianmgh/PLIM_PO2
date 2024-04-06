% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxESeriesCalAdjust(calHandle, referenceVoltage)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxESeriesCalAdjust', 'calHandle', 1);
    validateattributes(referenceVoltage, {'double'}, {'scalar'}, 'DAQmxESeriesCalAdjust', 'referenceVoltage', 2);
    [status]= mexNIDAQmx('DAQmxESeriesCalAdjust', calHandle, referenceVoltage);
end
