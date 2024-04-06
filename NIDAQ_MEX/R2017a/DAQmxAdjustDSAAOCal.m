% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxAdjustDSAAOCal(calHandle, channel, requestedLowVoltage, actualLowVoltage, requestedHighVoltage, actualHighVoltage, gainSetting)
    narginchk(7, 7);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxAdjustDSAAOCal', 'calHandle', 1);
    validateattributes(channel, {'uint32'}, {'scalar'}, 'DAQmxAdjustDSAAOCal', 'channel', 2);
    validateattributes(requestedLowVoltage, {'double'}, {'scalar'}, 'DAQmxAdjustDSAAOCal', 'requestedLowVoltage', 3);
    validateattributes(actualLowVoltage, {'double'}, {'scalar'}, 'DAQmxAdjustDSAAOCal', 'actualLowVoltage', 4);
    validateattributes(requestedHighVoltage, {'double'}, {'scalar'}, 'DAQmxAdjustDSAAOCal', 'requestedHighVoltage', 5);
    validateattributes(actualHighVoltage, {'double'}, {'scalar'}, 'DAQmxAdjustDSAAOCal', 'actualHighVoltage', 6);
    validateattributes(gainSetting, {'double'}, {'scalar'}, 'DAQmxAdjustDSAAOCal', 'gainSetting', 7);
    [status]= mexNIDAQmx('DAQmxAdjustDSAAOCal', calHandle, channel, requestedLowVoltage, actualLowVoltage, requestedHighVoltage, actualHighVoltage, gainSetting);
end
