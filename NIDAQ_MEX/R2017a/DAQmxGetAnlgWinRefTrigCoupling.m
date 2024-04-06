% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAnlgWinRefTrigCoupling(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAnlgWinRefTrigCoupling', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAnlgWinRefTrigCoupling', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAnlgWinRefTrigCoupling', taskHandle, data);
end
