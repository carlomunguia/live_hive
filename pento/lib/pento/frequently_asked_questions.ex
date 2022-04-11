defmodule Pento.FrequentlyAskedQuestions do
  @moduledoc """
  The FrequentlyAskedQuestions context.
  """

  import Ecto.Query, warn: false
  alias Pento.Repo

  alias Pento.FrequentlyAskedQuestions.FAQ

  @doc """
  Returns the list of faqs.

  ## Examples

      iex> list_faqs()
      [%FAQ{}, ...]

  """
  def list_faqs do
    Repo.all(FAQ)
  end

  @doc """
  Gets a single faq.

  Raises `Ecto.NoResultsError` if the Faq does not exist.

  ## Examples

      iex> get_faq!(123)
      %FAQ{}

      iex> get_faq!(456)
      ** (Ecto.NoResultsError)

  """
  def get_faq!(id), do: Repo.get!(FAQ, id)

  @doc """
  Creates a faq.

  ## Examples

      iex> create_faq(%{field: value})
      {:ok, %FAQ{}}

      iex> create_faq(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_faq(attrs \\ %{}) do
    %FAQ{}
    |> FAQ.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a faq.

  ## Examples

      iex> update_faq(faq, %{field: new_value})
      {:ok, %FAQ{}}

      iex> update_faq(faq, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_faq(%FAQ{} = faq, attrs) do
    faq
    |> FAQ.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a faq.

  ## Examples

      iex> delete_faq(faq)
      {:ok, %FAQ{}}

      iex> delete_faq(faq)
      {:error, %Ecto.Changeset{}}

  """
  def delete_faq(%FAQ{} = faq) do
    Repo.delete(faq)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking faq changes.

  ## Examples

      iex> change_faq(faq)
      %Ecto.Changeset{data: %FAQ{}}

  """
  def change_faq(%FAQ{} = faq, attrs \\ %{}) do
    FAQ.changeset(faq, attrs)
  end
end
