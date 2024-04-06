% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetPhysicalChanAOManualControlEnable(physicalChannel, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxGetPhysicalChanAOManualControlEnable', 'physicalChannel', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetPhysicalChanAOManualControlEnable', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetPhysicalChanAOManualControlEnable', physicalChannel, data);
end
