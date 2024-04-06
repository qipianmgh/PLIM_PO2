% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetPhysicalChanDIPortWidth(physicalChannel, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxGetPhysicalChanDIPortWidth', 'physicalChannel', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetPhysicalChanDIPortWidth', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetPhysicalChanDIPortWidth', physicalChannel, data);
end
