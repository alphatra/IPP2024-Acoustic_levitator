function hSphere = createSphere(x0, y0, z0, radius)
    [X, Y, Z] = sphere(20);
    Z = Z * radius + z0; % size and shift object axis z
    Y = Y * radius + y0; % size and shift object axis y
    X = X * radius + x0; % size and shift object axis x
    hSphere = surf(X, Y, Z); % visualize
end