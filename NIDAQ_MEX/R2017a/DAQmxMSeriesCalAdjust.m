% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxMSeriesCalAdjust(calHandle, referenceVoltage)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxMSeriesCalAdjust', 'calHandle', 1);
    validateattributes(referenceVoltage, {'double'}, {'scalar'}, 'DAQmxMSeriesCalAdjust', 'referenceVoltage', 2);
    [status]= mexNIDAQmx('DAQmxMSeriesCalAdjust', calHandle, referenceVoltage);
end
