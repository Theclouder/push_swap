/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   until_five_numbers.c                               :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vduchi <vduchi@student.42barcelona.com>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/18 20:11:18 by vduchi            #+#    #+#             */
/*   Updated: 2022/11/29 12:39:58 by vduchi           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "push_swap.h"

int	two_numbers(t_stack *stack)
{
	if (stack->stack_a[0] > stack->stack_a[1])
		sa(stack);
	return (1);
}

int	three_numbers(t_stack *stack)
{
	int	check;

	check = 0;
	while (!check)
	{
		if (stack->stack_a[0] > stack->stack_a[1])
			sa(stack);
		if (stack->stack_a[1] > stack->stack_a[2])
			rra(stack);
		if (stack->stack_a[0] < stack->stack_a[1]
			&& stack->stack_a[1] < stack->stack_a[2])
			check++;
	}
	return (1);
}

int	four_numbers(t_stack *stack, int n)
{
	int	check;

	check = 0;
	while (!check)
	{
		if (stack->supp_a[0] != n && stack->supp_a[1] != n)
		{
			rra(stack);
			continue ;
		}
		else if ((stack->supp_a[0] != n && stack->supp_a[1] == n)
			|| (stack->supp_a[0] != n && stack->supp_a[2] == n))
			ra(stack);
		check++;
	}
	pb(stack);
	three_numbers(stack);
	pa(stack);
	return (1);
}

int	five_numbers(t_stack *stack)
{
	int	check;

	check = 0;
	while (!check)
	{
		if (stack->supp_a[0] != 0 && stack->supp_a[1] != 0)
		{
			rra(stack);
			continue ;
		}
		else if ((stack->supp_a[0] != 0 && stack->supp_a[1] == 0)
			|| (stack->supp_a[0] != 0 && stack->supp_a[2] == 0))
			ra(stack);
		check++;
	}
	pb(stack);
	four_numbers(stack, 1);
	pa(stack);
	return (1);
}
