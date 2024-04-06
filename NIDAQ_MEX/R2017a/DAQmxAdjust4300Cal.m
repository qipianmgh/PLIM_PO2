% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxAdjust4300Cal(calHandle, refVoltage)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxAdjust4300Cal', 'calHandle', 1);
    validateattributes(refVoltage, {'double'}, {'scalar'}, 'DAQmxAdjust4300Cal', 'refVoltage', 2);
    [status]= mexNIDAQmx('DAQmxAdjust4300Cal', calHandle, refVoltage);
end
