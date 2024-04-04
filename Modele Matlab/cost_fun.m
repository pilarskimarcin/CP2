function error = cost_fun(parameters, stoptime, pend_ang_obiekt)

    InvPendulum_new_2022b
    simopt = simset('SrcWorkspace','base');
    model_name = 'InvPendulum_new_2022b';
    set_param(model_name, "StopTime", stoptime);
    get_param(model_name + "/Model/p1", "Gain")
    set_param(model_name + "/Model/p1", 'Gain', num2str(parameters));
    out1 = sim(model_name + ".slx", [], simopt);

    % Wyniki symulacji modelu
    theta = out1.out.signals(1).values(1:end, 3);
    length_diff = (size(theta) - size(pend_ang_obiekt));
    if length_diff > 0
        theta = theta(end - length_diff(1));
    else
        pend_ang_obiekt = pend_ang_obiekt(end + length_diff(1));
    end

    
    % Obliczenie b³êdu (np. œredni b³¹d kwadratowy)
    error = sum((theta - pend_ang_obiekt).^2)
end
