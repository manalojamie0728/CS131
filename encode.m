function encode(lat, lon, id, n)
  pass = [];
  t = [];
  for i = 1:n
    t = [t, randi([1000, 10000])];
    pass = [pass, lat*(t(i).^2) + lon.*t(i) + id];
  end
  dlmwrite("secret", [t, pass], "\n");
  dlmwrite("dontlook", id);
endfunction