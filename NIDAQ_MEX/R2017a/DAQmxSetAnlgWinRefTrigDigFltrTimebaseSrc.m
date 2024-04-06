% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetAnlgWinRefTrigDigFltrTimebaseSrc(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgWinRefTrigDigFltrTimebaseSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetAnlgWinRefTrigDigFltrTimebaseSrc', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetAnlgWinRefTrigDigFltrTimebaseSrc', taskHandle, data);
end
