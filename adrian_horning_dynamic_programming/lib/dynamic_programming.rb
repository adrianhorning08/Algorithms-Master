class DynamicProgramming

  def initialize
    @blair_cache = {
      1 => 1,
      2 => 2
    }
  end

  def blair_nums(n)
    return 1 if n == 1
    return 2 if n == 2
    if @blair_cache[n]
      return @blair_cache[n]
    else
      ans = blair_nums(n-2) + blair_nums(n-1) + ((n*2)-3)
      @blair_cache[n] = ans
    end
  end

  def frog_hops_bottom_up(n)
    frog_cache_builder(n)
  end

  def frog_cache_builder(n)
    cache = {
      1 => [[1]],
      2 => [[1,1], [2]]
    }
    return cache[n] if n == 1
    return cache[n] if n == 2

    
  end

  def frog_hops_top_down(n)

  end

  def frog_hops_top_down_helper(n)

  end

  def super_frog_hops(n, k)

  end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
