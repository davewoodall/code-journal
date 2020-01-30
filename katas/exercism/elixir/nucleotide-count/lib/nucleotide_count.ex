defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count(charlist(), char()) :: non_neg_integer()

  def count(strand, nucleotide) do
    Enum.reduce(strand, 0, &(&2 + compare(&1, nucleotide)))
  end

  defp compare(strand, compare) do
    cond do
      strand == compare -> 1
      strand != compare -> 0
    end
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram(charlist()) :: map()
  def histogram(strand) do
    %{
      ?A => Enum.count(strand, &(&1 == ?A)),
      ?T => Enum.count(strand, &(&1 == ?T)),
      ?C => Enum.count(strand, &(&1 == ?C)),
      ?G => Enum.count(strand, &(&1 == ?G))
    }
  end
end