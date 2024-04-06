% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, value] = DAQmxGetSystemInfoAttribute(attribute, value, varargs)
    % Not validating parameters due to VARARGS
    [status, value]= mexNIDAQmx('DAQmxGetSystemInfoAttribute', attribute, value, varargs);
end
