% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxAOSeriesCalAdjust(calHandle, referenceVoltage)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxAOSeriesCalAdjust', 'calHandle', 1);
    validateattributes(referenceVoltage, {'double'}, {'scalar'}, 'DAQmxAOSeriesCalAdjust', 'referenceVoltage', 2);
    [status]= mexNIDAQmx('DAQmxAOSeriesCalAdjust', calHandle, referenceVoltage);
end
