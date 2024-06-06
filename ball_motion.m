function dstate_dt = ball_motion(t, state, params)
    z = state(1);
    v = state(2);
    k = 2 * pi / params.wavelength;

    % Dokładniejsze modelowanie pola akustycznego
    distance_factor = sin(k * z) * exp(-z / params.transducer_distance);
    amplitude_effective = params.amplitude * distance_factor;

    % Gradient potencjału Gorkova
    d_gorkov_potential_dz = -(8 / 3) * pi * params.radius^3 * params.K1 * amplitude_effective^2 * k * sin(2 * k * z) * (1 + cos(k * (params.transducer_distance - 2 * z)));
    acoustic_force_gradient = d_gorkov_potential_dz;

    % Siła oporu powietrza z różnymi Re
    drag_force = -6 * pi * params.mu_air * params.radius * v;

    % Siła grawitacji
    gravity_force = -params.mass * 9.81;

    % Siła całkowita i przyspieszenie
    total_force = acoustic_force_gradient + drag_force + gravity_force;
    dv_dt = total_force / params.mass;
    dz_dt = v;

    % Zwracanie pochodnych
    dstate_dt = [dz_dt; dv_dt];
end
