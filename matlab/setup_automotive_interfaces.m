function interfaceTable = setup_automotive_interfaces()
%SETUP_AUTOMOTIVE_INTERFACES
% Defines the lightweight automotive signal interface used by the
% concept-level UrbanEV brake-request verification workflow.
%
% This is not an AUTOSAR interface and does not claim production ECU design.
% It is a scope-safe interface definition for MATLAB/Simulink verification.

    interfacePath = fullfile("data","automotive_signal_interface.csv");

    if ~isfile(interfacePath)
        error("Interface file not found: %s", interfacePath);
    end

    interfaceTable = readtable(interfacePath);

    disp("Automotive signal interface loaded successfully.")
    disp(interfaceTable(:,["SignalName","Direction","Unit","DataType","MinValue","MaxValue"]))

end