% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSSeriesCalAdjust(calHandle, referenceVoltage)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxSSeriesCalAdjust', 'calHandle', 1);
    validateattributes(referenceVoltage, {'double'}, {'scalar'}, 'DAQmxSSeriesCalAdjust', 'referenceVoltage', 2);
    [status]= mexNIDAQmx('DAQmxSSeriesCalAdjust', calHandle, referenceVoltage);
end
