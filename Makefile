# ================================================= #
NAME		=	relevantName
# ================================================= #

# ================================================= #
SRCS_DIR	=	./
SRCS		=	$(wildcard *.cpp) //add manually
# ================================================= #

# ================================================= #
INC			=	$(wildcard *.hpp) //add manually
# ================================================= #

# ================================================= #
OBJS_DIR	=	obj/
OBJ			=	$(SRCS:%.cpp=%.o)
OBJS		=	$(addprefix $(OBJS_DIR), $(OBJ))
# ================================================= #

# ================================================= #
CXX			=	@c++
FLAGS		=	-Wall -Wextra -Werror -std=c++98
RM			=	@rm -rf
# ================================================= #

# ================================================= #
$(OBJS_DIR)%.o :	$(SRCS_DIR)%.cpp
	@mkdir -p $(OBJS_DIR)
	@echo "\033[0;32mCompiling $<\033[0m"
	$(CXX) $(FLAGS) -c $< -o $@

$(NAME): $(OBJS)
	$(CXX) $(INC) $(FLAGS) $(OBJS)
	@mv a.out $(NAME)
	@mv *.gch $(OBJS_DIR)

all: $(NAME)

clean:
	@echo "\033[0;32mCleaning: $(OBJS_DIR)\033[0m"
	$(RM) $(OBJS_DIR)
	
fclean: clean
	@echo "\033[0;32mCleaning: $(NAME)\033[0m"
	$(RM) $(NAME)

re: fclean all
# ================================================= #

.PHONY: all clean fclean re
