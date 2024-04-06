% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetCISemiPeriodTerm(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCISemiPeriodTerm', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCISemiPeriodTerm', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetCISemiPeriodTerm', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetCISemiPeriodTerm', taskHandle, channel, data);
end
