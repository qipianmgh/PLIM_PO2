% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetAnlgLvlPauseTrigDigFltrTimebaseSrc(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgLvlPauseTrigDigFltrTimebaseSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetAnlgLvlPauseTrigDigFltrTimebaseSrc', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetAnlgLvlPauseTrigDigFltrTimebaseSrc', taskHandle, data);
end
