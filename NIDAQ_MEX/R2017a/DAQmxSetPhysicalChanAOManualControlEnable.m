% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetPhysicalChanAOManualControlEnable(physicalChannel, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxSetPhysicalChanAOManualControlEnable', 'physicalChannel', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetPhysicalChanAOManualControlEnable', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetPhysicalChanAOManualControlEnable', physicalChannel, data);
end
