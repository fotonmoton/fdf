// C/C++ File
// AUTHOR:   foton
// FILE:     main.c
// ROLE:     to rule them all
// CREATED:  2017-01-30 21:51:28
// MODIFIED: 2017-01-30 23:25:14


#include <stdio.h>
#include "libft.h"
#include "mlx.h"
#include <time.h>

void	put_square(int side, int init_x, int init_y, void *mlx, void *mlx_w, int hex_rgb)
{
	struct timespec tw = {0,10};
	struct timespec tr;

	int		temp_y;

	temp_y = init_y;
	while(init_x < side)
	{
		init_y = temp_y;
		while(init_y < side)
		{
			mlx_pixel_put(mlx, mlx_w, init_x, init_y, hex_rgb);
			nanosleep(&tw, &tr);
			init_y++;
		}
		init_x++;
	}
}

int		main(void)
{
	void	*mlx;
	void	*mlx_window;
	int		y;
	int		x;
	int		hex;

	mlx = mlx_init();
	mlx_window = mlx_new_window(mlx, 400, 400, "mlx test");
	y = 50;
	hex = 0xFFA6FB;
	while (y < 100)
	{
		x = 50;
		while (x < 100)
		{	
			put_square(100, x, y, mlx, mlx_window, hex);
			mlx_clear_window(mlx, mlx_window);
			printf("y = %d\n", y);
			hex += 0xFFA6FB;
			x++;
		}
		y++;
	}
	mlx_loop(mlx);
	return (0);
}
