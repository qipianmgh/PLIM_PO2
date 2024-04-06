% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAnlgWinRefTrigDigFltrTimebaseRate(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgWinRefTrigDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAnlgWinRefTrigDigFltrTimebaseRate', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAnlgWinRefTrigDigFltrTimebaseRate', taskHandle, data);
end
