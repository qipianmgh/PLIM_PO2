% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAnlgWinPauseTrigDigFltrTimebaseRate(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAnlgWinPauseTrigDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAnlgWinPauseTrigDigFltrTimebaseRate', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAnlgWinPauseTrigDigFltrTimebaseRate', taskHandle, data);
end
