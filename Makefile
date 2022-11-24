# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vduchi <vduchi@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/22 22:11:19 by vduchi            #+#    #+#              #
#    Updated: 2022/11/22 17:36:18 by vduchi           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Colors
DEL_LINE	=	\033[2K
ITALIC		=	\033[3m
BOLD		=	\033[1m
DEF_COLOR	=	\033[0;39m
GRAY		=	\033[0;90m
RED			=	\033[0;91m
GREEN		=	\033[0;92m
YELLOW		=	\033[0;93m
BLUE		=	\033[0;94m
MAGENTA		=	\033[0;95m
CYAN		=	\033[0;96m
WHITE		=	\033[0;97m
BLACK		=	\033[0;99m
ORANGE		=	\033[38;5;209m
BROWN		=	\033[38;2;184;143;29m
DARK_GRAY	=	\033[38;5;234m
MID_GRAY	=	\033[38;5;245m
DARK_GREEN	=	\033[38;2;75;179;82m
DARK_YELLOW =	\033[38;5;143m

NAME 		=	push_swap

SRCS_DIR	=	src
OBJ_DIR		=	obj
DEPS_DIR	=	dep
LIBS_DIR	=	libs
INC_DIR		=	inc/ libft/ ft_printf/include/

LIBFT		=	libft
PRINTF		=	ft_printf
ALL_LIBS	=	libft/libft.a ft_printf/libftprintf.a

SRCS		=	src/main.c src/utils.c src/checker.c src/sa.c src/sb.c \
				src/ss.c src/pa.c src/pb.c src/ra.c src/rb.c src/rr.c \
				src/rra.c src/rrb.c src/rrr.c src/until_five_numbers.c \
				src/until_hundred_numbers.c src/more_than_hundred.c \
				src/return_stack.c
OBJS		=	$(patsubst $(SRCS_DIR)/%, $(OBJ_DIR)/%, $(SRCS:.c=.o))
DEPS		=	$(patsubst $(SRCS_DIR)/%, $(DEPS_DIR)/%, $(SRCS:.c=.d))

CFLAGS		+= 	-Wall -Werror -Wextra -g -O3 $(addprefix -I , $(INC_DIR))
LDFLAGS		= 	-L libft -L ft_printf -lft -lftprintf -framework OpenGL -framework AppKit
DEPFLAGS	=	-MMD -MP -MF $(DEPS_DIR)/$*.d

RM			=	rm -rf
CC			=	gcc
MKDIR		=	mkdir -p

$(OBJ_DIR)/%.o :	$(SRCS_DIR)/%.c
	@echo "$(YELLOW)$(patsubst $(SRCS_DIR)/%,%, $<) \tcompiled!$(DEF_COLOR)"
	@$(CC) $(CFLAGS) $(DEPFLAGS) -c $< -o $@

all			:
	@$(MAKE) -C $(LIBFT)
	@$(MAKE) -C $(PRINTF)
	@$(MAKE) $(NAME)

$(NAME)		::
	@echo "$(MAGENTA)\nChecking push_swap...$(DEF_COLOR)"

$(NAME)		::	$(OBJ_DIR) $(DEPS_DIR) $(OBJS) $(ALL_LIBS)
	@echo "$(ORANGE)Compiling push_swap exec...$(DEF_COLOR)"
	@$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) -o $@

$(NAME)		::
	@echo "$(GREEN)Push_swap executable ready!$(DEF_COLOR)"

$(OBJ_DIR)	:
	@$(MKDIR) $@

$(DEPS_DIR)	:
	@$(MKDIR) $@

clean		:
	@$(RM) $(OBJ_DIR)
	@$(RM) $(DEPS_DIR)

fclean		:	clean
	@$(RM) $(NAME) $(LIBS_DIR)
	@$(MAKE) -C libft fclean
	@$(MAKE) -C ft_printf fclean
	@echo "$(BLUE)\nPush_swap cleaned!$(DEF_COLOR)"

re			:	fclean all

-include $(DEPS)

.PHONY: all clean fclean re

#
#valgrind:
#	valgrind --leak-check=yes --show-leak-kinds=all "nombre del executable" "nombre de argumentos"
#	valgrind --leak-check=yes --track-origins=yes "nombre del executable" "nombre de argumentos"
#
#	gcc $(CFLAGS) -fsanitize=address -g -O3 -fno-omit-frame-pointer $(LDFLAGS) $(SRCS) -o $@
