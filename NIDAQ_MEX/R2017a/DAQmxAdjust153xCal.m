% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxAdjust153xCal(calHandle, refVoltage, measOutput)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxAdjust153xCal', 'calHandle', 1);
    validateattributes(refVoltage, {'double'}, {'scalar'}, 'DAQmxAdjust153xCal', 'refVoltage', 2);
    validateattributes(measOutput, {'double'}, {'scalar'}, 'DAQmxAdjust153xCal', 'measOutput', 3);
    [status]= mexNIDAQmx('DAQmxAdjust153xCal', calHandle, refVoltage, measOutput);
end
