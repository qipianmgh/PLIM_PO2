% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetCOPulseTerm(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCOPulseTerm', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCOPulseTerm', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetCOPulseTerm', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetCOPulseTerm', taskHandle, channel, data);
end
