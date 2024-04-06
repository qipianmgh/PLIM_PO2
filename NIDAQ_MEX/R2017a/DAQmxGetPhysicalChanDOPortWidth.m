% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetPhysicalChanDOPortWidth(physicalChannel, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxGetPhysicalChanDOPortWidth', 'physicalChannel', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetPhysicalChanDOPortWidth', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetPhysicalChanDOPortWidth', physicalChannel, data);
end
