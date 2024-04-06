% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateMapScale(name, prescaledMin, prescaledMax, scaledMin, scaledMax, preScaledUnits, scaledUnits)
    narginchk(7, 7);
    nargoutchk(1, 1);
    validateattributes(name, {'char'}, {'vector'}, 'DAQmxCreateMapScale', 'name', 1);
    validateattributes(prescaledMin, {'double'}, {'scalar'}, 'DAQmxCreateMapScale', 'prescaledMin', 2);
    validateattributes(prescaledMax, {'double'}, {'scalar'}, 'DAQmxCreateMapScale', 'prescaledMax', 3);
    validateattributes(scaledMin, {'double'}, {'scalar'}, 'DAQmxCreateMapScale', 'scaledMin', 4);
    validateattributes(scaledMax, {'double'}, {'scalar'}, 'DAQmxCreateMapScale', 'scaledMax', 5);
    validateattributes(preScaledUnits, {'int32'}, {'scalar'}, 'DAQmxCreateMapScale', 'preScaledUnits', 6);
    validateattributes(scaledUnits, {'char'}, {'vector'}, 'DAQmxCreateMapScale', 'scaledUnits', 7);
    [status]= mexNIDAQmx('DAQmxCreateMapScale', name, prescaledMin, prescaledMax, scaledMin, scaledMax, preScaledUnits, scaledUnits);
end
