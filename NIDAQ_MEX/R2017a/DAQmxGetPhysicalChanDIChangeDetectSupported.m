% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetPhysicalChanDIChangeDetectSupported(physicalChannel, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxGetPhysicalChanDIChangeDetectSupported', 'physicalChannel', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetPhysicalChanDIChangeDetectSupported', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetPhysicalChanDIChangeDetectSupported', physicalChannel, data);
end
