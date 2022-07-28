# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chukim <chukim@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/17 10:41:39 by chukim            #+#    #+#              #
#    Updated: 2022/06/22 07:20:37 by chukim           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = so_long
LIBFT = libft
LIBFT_LIB = libft.a
SRCS = so_long.c \
		image.c \
		key.c \
		map.c \
		so_long_utils.c \
		get_next_line.c \
		get_next_line_utils.c \

OBJS = $(SRCS:%.c=%.o)
LIBC = ar rc
CFLAGS = -Wall -Wextra -Werror

all : $(NAME)

$(NAME) : $(OBJS)
	make all -C $(LIBFT)/
	gcc -o $(NAME) $(OBJS) -Llibft -lft -L./minilibx -lmlx -framework OpenGL -framework AppKit

.c.o : 
	gcc $(CFLAGS) -c $< -I.


clean :
	rm -f $(OBJS)
	make clean -C $(LIBFT)

fclean : clean
	rm -f $(NAME)
	rm -f $(LIBFT_LIB)
	make fclean -C $(LIBFT)

re : fclean all

.PHONY : all clean fclean re bonus