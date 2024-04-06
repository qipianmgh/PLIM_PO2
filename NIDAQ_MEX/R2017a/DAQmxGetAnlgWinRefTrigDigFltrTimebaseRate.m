% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAnlgWinRefTrigDigFltrTimebaseRate(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAnlgWinRefTrigDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAnlgWinRefTrigDigFltrTimebaseRate', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAnlgWinRefTrigDigFltrTimebaseRate', taskHandle, data);
end
