% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedHshkEventOutputBehavior(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedHshkEventOutputBehavior', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetExportedHshkEventOutputBehavior', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetExportedHshkEventOutputBehavior', taskHandle, data);
end
