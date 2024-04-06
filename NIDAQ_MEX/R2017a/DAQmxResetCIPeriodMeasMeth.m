% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIPeriodMeasMeth(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIPeriodMeasMeth', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIPeriodMeasMeth', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIPeriodMeasMeth', taskHandle, channel);
end
