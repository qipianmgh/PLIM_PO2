% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetExportedSignalAttribute(taskHandle, attribute, varargs)
    % Not validating parameters due to VARARGS
    [status]= mexNIDAQmx('DAQmxSetExportedSignalAttribute', taskHandle, attribute, varargs);
end
