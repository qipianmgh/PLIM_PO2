% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetPhysicalChanDISampClkSupported(physicalChannel, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxGetPhysicalChanDISampClkSupported', 'physicalChannel', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetPhysicalChanDISampClkSupported', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetPhysicalChanDISampClkSupported', physicalChannel, data);
end
