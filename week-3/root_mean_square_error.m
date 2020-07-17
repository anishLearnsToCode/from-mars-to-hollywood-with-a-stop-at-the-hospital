function err = root_mean_square_error(I, J)
    err = sum(sum((I - J) .^ 2));
end
