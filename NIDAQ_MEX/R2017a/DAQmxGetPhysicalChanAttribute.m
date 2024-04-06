% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, value] = DAQmxGetPhysicalChanAttribute(physicalChannel, attribute, value, varargs)
    % Not validating parameters due to VARARGS
    [status, value]= mexNIDAQmx('DAQmxGetPhysicalChanAttribute', physicalChannel, attribute, value, varargs);
end
