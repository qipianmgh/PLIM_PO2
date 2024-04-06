% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetPhysicalChanDOSampClkSupported(physicalChannel, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxGetPhysicalChanDOSampClkSupported', 'physicalChannel', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetPhysicalChanDOSampClkSupported', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetPhysicalChanDOSampClkSupported', physicalChannel, data);
end
