function showImage( image, image_title )
figure;
imagesc (single (image));
title(image_title);
colormap hot;
daspect ([1 1 1]);
axis tight;
colorbar;
end

