% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, value] = DAQmxGetExportedSignalAttribute(taskHandle, attribute, value, varargs)
    % Not validating parameters due to VARARGS
    [status, value]= mexNIDAQmx('DAQmxGetExportedSignalAttribute', taskHandle, attribute, value, varargs);
end
