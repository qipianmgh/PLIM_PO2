% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAnlgWinStartTrigDigFltrTimebaseRate(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgWinStartTrigDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAnlgWinStartTrigDigFltrTimebaseRate', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAnlgWinStartTrigDigFltrTimebaseRate', taskHandle, data);
end
