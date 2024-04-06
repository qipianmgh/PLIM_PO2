% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAnlgWinRefTrigBtm(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAnlgWinRefTrigBtm', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAnlgWinRefTrigBtm', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAnlgWinRefTrigBtm', taskHandle, data);
end
