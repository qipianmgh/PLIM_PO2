% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAnlgWinStartTrigCoupling(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAnlgWinStartTrigCoupling', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAnlgWinStartTrigCoupling', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAnlgWinStartTrigCoupling', taskHandle, data);
end
