% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetPhysicalChanAOManualControlEnable(physicalChannel)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxResetPhysicalChanAOManualControlEnable', 'physicalChannel', 1);
    [status]= mexNIDAQmx('DAQmxResetPhysicalChanAOManualControlEnable', physicalChannel);
end
