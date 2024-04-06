% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxXSeriesCalAdjust(calHandle, referenceVoltage)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxXSeriesCalAdjust', 'calHandle', 1);
    validateattributes(referenceVoltage, {'double'}, {'scalar'}, 'DAQmxXSeriesCalAdjust', 'referenceVoltage', 2);
    [status]= mexNIDAQmx('DAQmxXSeriesCalAdjust', calHandle, referenceVoltage);
end
