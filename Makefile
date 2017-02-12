# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gtertysh <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/14 16:54:48 by gtertysh          #+#    #+#              #
#    Updated: 2016/12/23 19:59:53 by gtertysh         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = fdf


SRCDIR = ./src/

OBJDIR = ./obj/


SRC_FILES = main.c

OBJ_FILES = $(SRC_FILES:.c=.o)


SRC = $(addprefix $(SRCDIR), $(SRC_FILES))

OBJ = $(addprefix $(OBJDIR), $(OBJ_FILES))


INC = -I ./inc -I $(LIBFT_FOLDER)includes -I $(MLX_FOLDER)


LIBFT = libft.a

MLX = libmlx.a


LIBFT_FLAGS = -lft -L $(LIBFT_FOLDER)

MLX_FLAGS = -lmlx -lXext -lX11 -L $(MLX_FOLDER)


LIBFT_FOLDER = ./libft/

MLX_FOLDER = ./minilibx/


FLAGS = -Werror -Wextra -Wall

CC = gcc


all: $(NAME)

$(NAME): $(OBJ) $(LIBFT_FOLDER)$(LIBFT) $(MLX_FOLDER)$(MLX)
	$(CC) $(FLAGS) $(OBJ) $(LIBFT_FLAGS) $(MLX_FLAGS) -o $(NAME)

$(OBJDIR)%.o : $(SRCDIR)%.c
	$(CC) $(FLAGS) $(INC) -c $< -o $@  

$(LIBFT_FOLDER)$(LIBFT):
	make -C $(LIBFT_FOLDER)

$(MLX_FOLDER)$(MLX):
	make -C $(MLX_FOLDER)
	
clean:
	rm -rf $(OBJ)

fclean: clean
	rm -rf $(NAME)

libclean:
	make clean -C $(LIBFT_FOLDER)
	make clean -C $(MLX_FOLDER)

libfclean:
	make fclean -C $(LIBFT_FOLDER)

re: fclean libfclean all
