% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSCBaseboardCalAdjust(calHandle, referenceVoltage)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxSCBaseboardCalAdjust', 'calHandle', 1);
    validateattributes(referenceVoltage, {'double'}, {'scalar'}, 'DAQmxSCBaseboardCalAdjust', 'referenceVoltage', 2);
    [status]= mexNIDAQmx('DAQmxSCBaseboardCalAdjust', calHandle, referenceVoltage);
end
