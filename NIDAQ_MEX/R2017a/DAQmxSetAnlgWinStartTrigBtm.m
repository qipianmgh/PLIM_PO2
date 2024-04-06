% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAnlgWinStartTrigBtm(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgWinStartTrigBtm', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAnlgWinStartTrigBtm', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAnlgWinStartTrigBtm', taskHandle, data);
end
