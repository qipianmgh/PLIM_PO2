% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevAIVoltageIntExcitRangeVals(device, data, arraySizeInElements)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevAIVoltageIntExcitRangeVals', 'device', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetDevAIVoltageIntExcitRangeVals', 'data', 2);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxGetDevAIVoltageIntExcitRangeVals', 'arraySizeInElements', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDevAIVoltageIntExcitRangeVals', device, data, arraySizeInElements);
end
