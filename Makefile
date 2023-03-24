# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gde-alme <gde-alme@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/09 01:03:14 by gde-alme          #+#    #+#              #
#    Updated: 2023/03/24 18:04:51 by gde-alme         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ================================================= #
NAME	=	ex03_interface_recap
# ================================================= #

# ================================================= #
SRCS_DIR	=	./src/
SRCS		=	AMateria.cpp
SRCS 		+=	ICharacter.cpp
SRCS 		+=	Ice.cpp
#SRCS 		+=	Cure.cpp
SRCS		+=	main.cpp
# ================================================= #

# ================================================= #
OBJS_DIR	=	obj/
OBJ			=	$(SRCS:%.cpp=%.o)
OBJS		=	$(addprefix $(OBJS_DIR), $(OBJ))
# ================================================= #

# ================================================= #
CXX			=	c++
FLAGS		=	-Wall -Wextra -Werror -std=c++98
RM			=	rm -rf
# ================================================= #

# ================================================= #
#$(OBJS_DIR) :
#	mkdir -p obj/

all: mkdir $(NAME)

$(OBJS_DIR)%.o :	$(SRCS_DIR)%.cpp
	$(CXX) $(FLAGS) -c $< -o $@

$(NAME): $(OBJS)
	$(CXX) $(FLAGS) -o $(NAME) $(OBJS)

clean:
	$(RM) $(OBJS_DIR)
	
fclean: clean
	$(RM) $(NAME)

re: fclean all

test: fclean
	g++ -D VERBOSE=false inc/*.hpp src/*.cpp -o $(NAME)
	@./$(NAME)

mkdir:
	mkdir -p obj/
# ================================================= #

.PHONY: all clean fclean re
