% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetCIPeriodTerm(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIPeriodTerm', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIPeriodTerm', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetCIPeriodTerm', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetCIPeriodTerm', taskHandle, channel, data);
end
