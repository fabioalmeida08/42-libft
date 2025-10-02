NAME = libft.a
AR = ar -rcs
RM = rm -f
CC = cc
CCFLAGS = -Wall -Wextra -Werror
INCLUDE = -I includes/

PART1 = ft_isalpha.c \
				ft_isdigit.c \
				ft_isalnum.c \
				ft_isascii.c \
				ft_isprint.c \
				ft_strlen.c \
				ft_memset.c \
				ft_bzero.c \
				ft_memcpy.c \
				ft_memmove.c \
				ft_strlcpy.c \
				ft_strlcat.c \
				ft_toupper.c \
				ft_tolower.c \
				ft_strchr.c \
				ft_strrchr.c \
				ft_strncmp.c \
				ft_memchr.c \
				ft_memcmp.c \
				ft_strnstr.c \
				ft_atoi.c \
				ft_calloc.c \
				ft_strdup.c \
				ft_atdbl.c \

PART2 = ft_substr.c \
				ft_strjoin.c \
				ft_strtrim.c \
				ft_split.c \
				ft_itoa.c \
				ft_strmapi.c \
				ft_striteri.c \
				ft_putchar_fd.c \
				ft_putstr_fd.c \
				ft_putendl_fd.c \
				ft_putnbr_fd.c \

PRINTF = ft_printf.c \
				ft_char_handler.c \
				ft_str_handler.c \
				ft_nbr_handler.c \
				ft_unbr_handler.c \
				ft_ptr_handler.c \
				ft_hex_handler.c 

BONUS = ft_lstnew_bonus.c \
				ft_lstadd_front_bonus.c \
				ft_lstsize_bonus.c \
				ft_lstlast_bonus.c \
				ft_lstadd_back_bonus.c \
				ft_lstdelone_bonus.c \
				ft_lstclear_bonus.c \
				ft_lstiter_bonus.c \
				ft_lstmap_bonus.c

GNL = get_next_line.c \
			get_next_line_utils.c\

GREEN = \033[0;32m
RED = \033[0;31m
RESET = \033[0m

OBJS_DIR = objs
SRCS_DIR = src

# SRC := $(addprefix src/, $(PART1) $(PART2) $(PRINTF) $(GNL) $(BONUS))

SRCS := $(PART1) $(PART2) $(PRINTF) $(GNL) $(BONUS)
SRCS := $(SRCS:%=$(SRCS_DIR)/%)

OBJS := $(SRCS:$(SRCS_DIR)/%.c=$(OBJS_DIR)/%.o)
# OBJS := $(patsubst src/%.c, $(OBJS_DIR)/%.o, $(SRC))

all: $(NAME)

$(NAME): $(OBJS)
	@$(AR) $(NAME) $(OBJS)
	@echo "🗜️$(GREEN) Objects files compiled$(RESET) ✅"
	@echo "🗂️ $(GREEN)$(NAME)$(LIBFT) was created$(RESET) ✅"

bonus:
	@$(MAKE) --no-print-directory OBJS="$(OBJS) $(BONUS_OBJS)"

$(OBJS_DIR)/%.o: $(SRCS_DIR)/%.c
	@mkdir -p $(OBJS_DIR)
	@$(CC) $(CCFLAGS) $(INCLUDE) -c $< -o $@

clean:
	@$(RM) $(OBJS) $(BONUS_OBJS)
	@rm -rf $(OBJS_DIR)
	@echo "$(RED)🧹 All Objects files removed$(RESET)"

fclean: clean
	@$(RM) $(NAME)
	@echo "$(RED)💥 $(NAME) removed$(RESET)"

re: fclean all

.PHONY: all clean fclean re
