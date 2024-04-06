% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCOPulseTerm(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCOPulseTerm', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCOPulseTerm', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCOPulseTerm', taskHandle, channel);
end
